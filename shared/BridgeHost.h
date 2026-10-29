#pragma once
#ifndef NOMINMAX
#define NOMINMAX
#endif
#include <Windows.h>
#include <array>
#include <cstring>
#include <string>
#include <utility>
#include "BridgeProtocol.h"
#include "BridgeQueue.h"

namespace bridge {
// Called only from the game thread. PIPE_NOWAIT prevents waits on the game loop.
// No background thread or DLL-unload/thread-join interaction is needed.
class Host {
    HANDLE pipe_ = INVALID_HANDLE_VALUE;
    bool connected_ = false;
    bool pendingWrite_ = false;
    std::size_t received_ = 0;
    std::size_t sent_ = 0;
    std::array<unsigned char, sizeof(Packet)> input_{};
    Packet output_{};
    ULONGLONG started_ = GetTickCount64();
    ULONGLONG retryAt_ = 0;
    DWORD lastError_ = ERROR_SUCCESS;
    std::wstring name_;
    bool simulated_;
    Queue queue_;

    void Disconnect() {
        DisconnectNamedPipe(pipe_);
        connected_ = false;
        pendingWrite_ = false;
        received_ = sent_ = 0;
    }

public:
    explicit Host(std::wstring name = PipeName, bool simulated = false)
        : name_(std::move(name)), simulated_(simulated) {}
    Host(const Host&) = delete;
    Host& operator=(const Host&) = delete;
    ~Host() { if (pipe_ != INVALID_HANDLE_VALUE) CloseHandle(pipe_); }
    DWORD LastError() const { return lastError_; }
    Queue& Commands() { return queue_; }

    void Tick(std::uint64_t frames) {
        if (pipe_ == INVALID_HANDLE_VALUE) {
            if (GetTickCount64() < retryAt_) return;
            pipe_ = CreateNamedPipeW(name_.c_str(),
                PIPE_ACCESS_DUPLEX | FILE_FLAG_FIRST_PIPE_INSTANCE,
                PIPE_TYPE_BYTE | PIPE_READMODE_BYTE | PIPE_NOWAIT | PIPE_REJECT_REMOTE_CLIENTS,
                1, sizeof(Packet) * 2, sizeof(Packet) * 2, 0, nullptr);
            if (pipe_ == INVALID_HANDLE_VALUE) {
                lastError_ = GetLastError();
                retryAt_ = GetTickCount64() + 1000;
                return;
            }
            lastError_ = ERROR_SUCCESS;
        }
        if (!connected_) {
            const BOOL accepted = ConnectNamedPipe(pipe_, nullptr);
            const DWORD error = accepted ? ERROR_SUCCESS : GetLastError();
            if (!accepted && error != ERROR_PIPE_CONNECTED) {
                if (error != ERROR_PIPE_LISTENING) Disconnect();
                return;
            }
            connected_ = true;
        }
        // Bounded work: at most four packets per game tick.
        for (int budget = 0; budget < 4; ++budget) {
            if (pendingWrite_) {
                DWORD written = 0;
                const auto* bytes = reinterpret_cast<const unsigned char*>(&output_);
                if (!WriteFile(pipe_, bytes + sent_, static_cast<DWORD>(sizeof(Packet) - sent_), &written, nullptr)) {
                    Disconnect();
                    return;
                }
                sent_ += written;
                if (sent_ != sizeof(Packet)) return;
                pendingWrite_ = false;
                sent_ = 0;
            }
            DWORD read = 0;
            if (!ReadFile(pipe_, input_.data() + received_,
                static_cast<DWORD>(sizeof(Packet) - received_), &read, nullptr)) {
                if (GetLastError() != ERROR_NO_DATA) Disconnect();
                return;
            }
            if (read == 0) return;
            received_ += read;
            if (received_ != sizeof(Packet)) return;
            Packet request;
            std::memcpy(&request, input_.data(), sizeof(request));
            received_ = 0;
            if (request.magic != Magic || request.version != Version ||
                (request.kind != StatusRequest && request.kind != LoadRequest && request.kind != CommandRequest &&
                 request.kind != RunRequest && request.kind != StopRequest)) {
                Disconnect();
                return;
            }
            output_ = Packet{};
            output_.kind = request.kind + 1;
            output_.requestId = request.requestId;
            output_.processId = GetCurrentProcessId();
            output_.flags = simulated_ ? Simulated : 0;
            if (queue_.WorkerIsReady()) output_.flags |= WorkerReady;
            output_.frames = frames;
            output_.uptimeMs = GetTickCount64() - started_;
            if (request.kind == LoadRequest || request.kind == RunRequest) queue_.Enqueue(request, output_);
            if (request.kind == CommandRequest) queue_.Lookup(request.commandId, output_);
            if (request.kind == StopRequest) queue_.Stop(request.commandId, output_);
            pendingWrite_ = true;
        }
    }
};
}
