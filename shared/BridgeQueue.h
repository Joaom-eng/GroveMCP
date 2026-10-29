#pragma once
#include <Windows.h>
#include <algorithm>
#include <cstring>
#include <deque>
#include <mutex>
#include <string>
#include <unordered_map>
#include "BridgeProtocol.h"

namespace bridge {
// C ABI shared with LuaJIT FFI. Path uses Windows ANSI, as consumed by MoonLoader.
struct LuaCommand {
    std::uint32_t id;
    std::uint32_t operation;
    char path[1024];
    std::uint32_t timeoutMs;
    char json[JsonCapacity];
};
static_assert(sizeof(LuaCommand) == 17420);

class Queue {
    struct Record {
        Packet result;
        LuaCommand command;
        ULONGLONG created;
    };
    std::mutex mutex_;
    std::unordered_map<std::uint32_t, Record> records_;
    std::deque<std::uint32_t> pending_;
    std::deque<std::uint32_t> order_;
    std::deque<std::uint32_t> stops_;
    std::uint32_t nextId_ = 1;
    ULONGLONG lastPoll_ = 0;

    bool Ready() const { return lastPoll_ != 0 && GetTickCount64() - lastPoll_ <= 2000; }
    void Expire() {
        const auto now = GetTickCount64();
        while (!pending_.empty()) {
            auto& record = records_.at(pending_.front());
            if (now - record.created <= 30000) break;
            record.result.state = Failed;
            strcpy_s(record.result.message, "Command expired before MoonLoader claimed it");
            pending_.pop_front();
        }
    }
    void Trim() {
        while (records_.size() >= 256) {
            const auto done = std::find_if(order_.begin(), order_.end(), [&](auto id) {
                const auto state = records_.at(id).result.state;
                return state == Loaded || state == Failed || state == Completed || state == Cancelled;
            });
            if (done == order_.end()) break;
            records_.erase(*done);
            order_.erase(done);
        }
    }
    static bool AnsiPath(const char* utf8, char (&output)[1024]) {
        if (std::memchr(utf8, 0, 1024) == nullptr || utf8[0] == 0) return false;
        wchar_t wide[1024];
        if (!MultiByteToWideChar(CP_UTF8, MB_ERR_INVALID_CHARS, utf8, -1, wide, 1024)) return false;
        if (GetACP() == CP_UTF8) { strcpy_s(output, utf8); return true; }
        BOOL substituted = FALSE;
        const int size = WideCharToMultiByte(CP_ACP, WC_NO_BEST_FIT_CHARS, wide, -1,
            output, 1024, nullptr, &substituted);
        return size > 0 && !substituted;
    }
public:
    bool WorkerIsReady() { std::lock_guard<std::mutex> lock(mutex_); return Ready(); }
    void Enqueue(const Packet& request, Packet& response) {
        std::lock_guard<std::mutex> lock(mutex_);
        Expire();
        if (!Ready()) {
            response.error = MissingWorker;
            strcpy_s(response.message, "MoonLoader bridge.lua is not polling the ASI");
            return;
        }
        Trim();
        if (pending_.size() >= 64 || records_.size() >= 256) {
            response.error = QueueFull;
            strcpy_s(response.message, "Command queue/history is full");
            return;
        }
        LuaCommand command{};
        if (request.kind == RunRequest && (request.timeoutMs < 100 || request.timeoutMs > 300000 ||
            std::memchr(request.json, 0, JsonCapacity) == nullptr)) {
            response.error = InvalidState;
            strcpy_s(response.message, "Invalid execution timeout or parameter buffer");
            return;
        }
        if (!AnsiPath(request.path, command.path)) {
            response.error = InvalidPath;
            strcpy_s(response.message, "Path cannot be represented in the Windows ANSI code page");
            return;
        }
        while (nextId_ == 0 || records_.count(nextId_)) ++nextId_;
        command.id = nextId_++;
        command.operation = request.kind;
        command.timeoutMs = request.timeoutMs;
        if (request.kind == RunRequest) strcpy_s(command.json, request.json);
        response.commandId = command.id;
        response.state = Queued;
        strcpy_s(response.path, request.path);
        response.timeoutMs = command.timeoutMs;
        Record record{response, command, GetTickCount64()};
        records_.emplace(command.id, record);
        order_.push_back(command.id);
        pending_.push_back(command.id);
    }
    void Lookup(std::uint32_t id, Packet& response) {
        std::lock_guard<std::mutex> lock(mutex_);
        Expire();
        const auto found = records_.find(id);
        if (found == records_.end()) {
            response.error = UnknownCommand;
            strcpy_s(response.message, "Unknown command (history is bounded and resets with the ASI)");
            return;
        }
        const auto& result = found->second.result;
        response.commandId = id;
        response.state = result.state;
        response.scriptId = result.scriptId;
        strcpy_s(response.path, result.path);
        strcpy_s(response.message, result.message);
        response.timeoutMs = result.timeoutMs;
        strcpy_s(response.json, result.json);
    }
    void Stop(std::uint32_t id, Packet& response) {
        std::lock_guard<std::mutex> lock(mutex_);
        Expire();
        const auto found = records_.find(id);
        if (found == records_.end()) {
            response.error = UnknownCommand;
            strcpy_s(response.message, "Unknown managed execution"); return;
        }
        auto& record = found->second;
        if (record.command.operation != RunRequest) {
            response.error = InvalidState;
            strcpy_s(response.message, "Only managed executions can be stopped"); return;
        }
        auto& result = record.result;
        if (result.state == Queued) {
            pending_.erase(std::remove(pending_.begin(), pending_.end(), id), pending_.end());
            result.state = Cancelled;
        } else if (result.state == Loading || result.state == Running) {
            result.state = Cancelling;
            stops_.push_back(id);
        }
        response.commandId = id;
        response.state = result.state;
        response.scriptId = result.scriptId;
        strcpy_s(response.path, result.path);
        strcpy_s(response.json, result.json);
    }
    int Poll(LuaCommand* output, std::uint32_t size) {
        if (!output || size != sizeof(LuaCommand)) return -1;
        std::lock_guard<std::mutex> lock(mutex_);
        lastPoll_ = GetTickCount64();
        Expire();
        while (!stops_.empty()) {
            const auto id = stops_.front(); stops_.pop_front();
            const auto found = records_.find(id);
            if (found != records_.end() && found->second.result.state == Cancelling) {
                *output = found->second.command;
                output->operation = StopRequest;
                return 1;
            }
        }
        if (pending_.empty()) return 0;
        auto& record = records_.at(pending_.front());
        *output = record.command;
        record.result.state = Loading;
        pending_.pop_front();
        return 1;
    }
    int Execution(std::uint32_t id, std::uint32_t state, std::int32_t scriptId,
        const char* json, std::uint32_t length) {
        if (!json || length >= JsonCapacity || std::memchr(json, 0, length) != nullptr ||
            (state != Running && state != Completed && state != Failed && state != Cancelled)) return -1;
        std::lock_guard<std::mutex> lock(mutex_);
        const auto found = records_.find(id);
        if (found == records_.end() || found->second.command.operation != RunRequest) return 0;
        auto& result = found->second.result;
        if (result.state != Loading && result.state != Running && result.state != Cancelling) return 0;
        if (result.state == Cancelling && state != Cancelled && state != Failed) return 0;
        result.state = state;
        if (scriptId >= 0) result.scriptId = scriptId;
        std::memcpy(result.json, json, length);
        result.json[length] = 0;
        return 1;
    }
    int Report(std::uint32_t id, bool success, std::int32_t scriptId, const char* message) {
        std::lock_guard<std::mutex> lock(mutex_);
        const auto found = records_.find(id);
        if (found == records_.end() || found->second.result.state != Loading ||
            found->second.command.operation != LoadRequest) return 0;
        auto& result = found->second.result;
        result.state = success ? Loaded : Failed;
        result.scriptId = scriptId;
        // Keep response text ASCII/UTF-8; bridge.lua reports a fixed ASCII summary.
        if (message) strncpy_s(result.message, message, _TRUNCATE);
        return 1;
    }
};
}
