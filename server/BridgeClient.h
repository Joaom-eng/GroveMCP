#pragma once
#include "../shared/BridgeHost.h"
#include <stdexcept>

namespace bridge {
class Handle {
    HANDLE value_;
public:
    explicit Handle(HANDLE value) : value_(value) {}
    ~Handle() { if (value_ && value_ != INVALID_HANDLE_VALUE) CloseHandle(value_); }
    operator HANDLE() const { return value_; }
    Handle(const Handle&) = delete;
    Handle& operator=(const Handle&) = delete;
};

inline void Fail(const char* operation, DWORD error) {
    throw std::runtime_error(std::string(operation) + " (Windows error " + std::to_string(error) + ")");
}

inline void Transfer(HANDLE pipe, void* buffer, DWORD size, bool writing, ULONGLONG deadline) {
    auto* bytes = static_cast<unsigned char*>(buffer);
    DWORD transferred = 0;
    while (transferred < size) {
        Handle event(CreateEventW(nullptr, TRUE, FALSE, nullptr));
        if (!event) Fail("CreateEvent", GetLastError());
        OVERLAPPED operation{};
        operation.hEvent = event;
        DWORD count = 0;
        const BOOL immediate = writing
            ? WriteFile(pipe, bytes + transferred, size - transferred, &count, &operation)
            : ReadFile(pipe, bytes + transferred, size - transferred, &count, &operation);
        if (!immediate) {
            const DWORD error = GetLastError();
            if (error != ERROR_IO_PENDING) Fail(writing ? "WriteFile" : "ReadFile", error);
            const auto now = GetTickCount64();
            const DWORD remaining = now < deadline ? static_cast<DWORD>(deadline - now) : 0;
            const DWORD wait = WaitForSingleObject(event, remaining);
            if (wait != WAIT_OBJECT_0) {
                const DWORD waitError = wait == WAIT_TIMEOUT ? ERROR_TIMEOUT : GetLastError();
                CancelIoEx(pipe, &operation);
                // OVERLAPPED and its buffer must survive cancellation completion.
                GetOverlappedResult(pipe, &operation, &count, TRUE);
                Fail("Bridge response wait", waitError);
            }
            if (!GetOverlappedResult(pipe, &operation, &count, FALSE)) Fail("Bridge I/O", GetLastError());
        }
        if (count == 0) Fail("Bridge disconnected", ERROR_BROKEN_PIPE);
        transferred += count;
    }
}

inline Packet Exchange(const std::wstring& name, Packet request, DWORD timeoutMs = 1500) {
    // Each request owns a short-lived connection; EXE restarts need no game restart.
    const ULONGLONG deadline = GetTickCount64() + timeoutMs;
    HANDLE raw = INVALID_HANDLE_VALUE;
    for (;;) {
        raw = CreateFileW(name.c_str(), GENERIC_READ | GENERIC_WRITE, 0, nullptr,
            OPEN_EXISTING, FILE_FLAG_OVERLAPPED, nullptr);
        if (raw != INVALID_HANDLE_VALUE) break;
        const DWORD error = GetLastError();
        if (error != ERROR_PIPE_BUSY) Fail("Connect to GTA bridge", error);
        if (GetTickCount64() >= deadline) Fail("Bridge busy", ERROR_TIMEOUT);
        WaitNamedPipeW(name.c_str(), 25);
    }
    Handle pipe(raw);
    request.requestId = 1;
    Transfer(pipe, &request, sizeof(request), true, deadline);
    Packet response;
    Transfer(pipe, &response, sizeof(response), false, deadline);
    if (response.magic != Magic || response.version != Version ||
        response.kind != request.kind + 1 || response.requestId != request.requestId ||
        std::memchr(response.path, 0, sizeof(response.path)) == nullptr ||
        std::memchr(response.message, 0, sizeof(response.message)) == nullptr ||
        std::memchr(response.json, 0, sizeof(response.json)) == nullptr)
        throw std::runtime_error("Invalid GTA bridge response");
    return response;
}
inline Packet QueryStatus(const std::wstring& name, DWORD timeoutMs = 1500) {
    return Exchange(name, Packet{}, timeoutMs);
}
}
