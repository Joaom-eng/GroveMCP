#pragma once
#include <cstdint>

namespace bridge {
inline constexpr wchar_t PipeName[] = L"\\\\.\\pipe\\McpServer.GtaSa.v3";
inline constexpr std::uint32_t Magic = 0x5341434D;
inline constexpr std::uint32_t Version = 3;
inline constexpr std::uint32_t JsonCapacity = 16384;
inline constexpr std::uint32_t RunRequest = 7;
inline constexpr std::uint32_t RunResponse = 8;
inline constexpr std::uint32_t StopRequest = 9;
inline constexpr std::uint32_t StopResponse = 10;
inline constexpr std::uint32_t Running = 5;
inline constexpr std::uint32_t Completed = 6;
inline constexpr std::uint32_t Cancelled = 7;
inline constexpr std::uint32_t Cancelling = 8;
inline constexpr std::uint32_t InvalidState = 5;
inline constexpr std::uint32_t StatusRequest = 1;
inline constexpr std::uint32_t StatusResponse = 2;
inline constexpr std::uint32_t Simulated = 1;
inline constexpr std::uint32_t WorkerReady = 2;
inline constexpr std::uint32_t LoadRequest = 3;
inline constexpr std::uint32_t LoadResponse = 4;
inline constexpr std::uint32_t CommandRequest = 5;
inline constexpr std::uint32_t CommandResponse = 6;
inline constexpr std::uint32_t Queued = 1;
inline constexpr std::uint32_t Loading = 2;
inline constexpr std::uint32_t Loaded = 3;
inline constexpr std::uint32_t Failed = 4;
inline constexpr std::uint32_t MissingWorker = 1;
inline constexpr std::uint32_t QueueFull = 2;
inline constexpr std::uint32_t UnknownCommand = 3;
inline constexpr std::uint32_t InvalidPath = 4;

// Fixed-size, little-endian wire format. No pointers or compiler-sized types.
#pragma pack(push, 1)
struct Packet {
    std::uint32_t magic = Magic;
    std::uint32_t version = Version;
    std::uint32_t kind = StatusRequest;
    std::uint32_t requestId = 0;
    std::uint32_t processId = 0;
    std::uint32_t flags = 0;
    std::uint64_t frames = 0;
    std::uint64_t uptimeMs = 0;
    std::uint32_t commandId = 0;
    std::uint32_t state = 0;
    std::int32_t scriptId = -1;
    std::uint32_t error = 0;
    char path[1024]{};    // UTF-8 on the pipe.
    char message[512]{};
    std::uint32_t timeoutMs = 30000;
    char json[JsonCapacity]{}; // UTF-8 JSON parameters or latest execution result/error.
};
#pragma pack(pop)
static_assert(sizeof(Packet) == 17980);
}
