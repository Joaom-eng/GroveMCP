#include <plugin.h>
#include "../shared/BridgeHost.h"

// The pipe is opened lazily on the first game-process event, outside DllMain.
// All MoonLoader operations happen in bridge.lua, through the exported queue API.
namespace {
struct Main {
    bridge::Host host;
    std::uint64_t frames = 0;

    Main() {
        plugin::Events::gameProcessEvent += [] { Instance().OnGameProcess(); };
    }
    void OnGameProcess() { host.Tick(++frames); }
    static Main& Instance();
};
Main instance;
Main& Main::Instance() { return instance; }
}

extern "C" __declspec(dllexport) unsigned int __cdecl McpBridge_GetApiVersion() {
    return bridge::Version;
}
extern "C" __declspec(dllexport) int __cdecl McpBridge_PollCommand(
    bridge::LuaCommand* output, unsigned int size) {
    return instance.host.Commands().Poll(output, size);
}
extern "C" __declspec(dllexport) int __cdecl McpBridge_ReportResult(
    unsigned int id, int success, int scriptId, const char* message) {
    return instance.host.Commands().Report(id, success != 0, scriptId, message);
}
extern "C" __declspec(dllexport) int __cdecl McpBridge_ReportExecution(
    unsigned int id, unsigned int state, int scriptId, const char* json, unsigned int length) {
    return instance.host.Commands().Execution(id, state, scriptId, json, length);
}
