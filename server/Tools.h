#pragma once
#include "BridgeClient.h"
#include <nlohmann/json.hpp>
#include <filesystem>
#include <cctype>

namespace mcp {
using json = nlohmann::json;
class InvalidArguments : public std::runtime_error { using std::runtime_error::runtime_error; };

inline json Tool(const char* name, const char* description, json schema, bool readOnly) {
    return {{"name", name}, {"description", description}, {"inputSchema", schema},
        {"annotations", {{"readOnlyHint", readOnly}, {"destructiveHint", !readOnly},
            {"idempotentHint", readOnly}, {"openWorldHint", false}}}};
}
inline json Tools() {
    return json::array({
        Tool("gta_get_status", "Query ASI connection, game processing and MoonLoader worker availability.",
            {{"type", "object"}, {"properties", json::object()}, {"additionalProperties", false}}, true),
        Tool("gta_load_script", "Queue an existing absolute .lua file for script.load in MoonLoader. Returns a command_id; query gta_get_command to confirm loading. Do not retry automatically after a transport timeout: it may already be queued. Loading is not proof the script finished successfully.",
            {{"type", "object"}, {"properties", {{"path", {{"type", "string"}, {"minLength", 1}, {"maxLength", 1023}}}}},
                {"required", json::array({"path"})}, {"additionalProperties", false}}, false),
        Tool("gta_run_script", "Run a managed Lua module that returns function(ctx). Returns command_id; gta_get_command retrieves running/completed/failed state and JSON result or traceback. Do not automatically retry a timed-out submission.",
            {{"type", "object"}, {"properties", {{"path", {{"type", "string"}}},
                {"params", {{"type", "object"}}}, {"timeout_ms", {{"type", "integer"}, {"minimum", 100}, {"maximum", 300000}, {"default", 30000}}}}},
                {"required", json::array({"path"})}, {"additionalProperties", false}}, false),
        Tool("gta_stop_script", "Request cancellation and unload of a managed execution. Query gta_get_command to confirm cancelled; this cannot undo game changes already made by the script.",
            {{"type", "object"}, {"properties", {{"command_id", {{"type", "integer"}, {"minimum", 1}, {"maximum", 4294967295ULL}}}}},
                {"required", json::array({"command_id"})}, {"additionalProperties", false}}, false),
        Tool("gta_get_command", "Get command state. Managed runs return latest JSON result (including progress snapshots) or execution_error. History resets with the ASI and retains at most 256 commands.",
            {{"type", "object"}, {"properties", {{"command_id", {{"type", "integer"}, {"minimum", 1}, {"maximum", 4294967295ULL}}}}},
                {"required", json::array({"command_id"})}, {"additionalProperties", false}}, true)
    });
}
inline json Status(const std::wstring& pipe) {
    try {
        const auto state = bridge::QueryStatus(pipe);
        return {{"connected", true}, {"process_id", state.processId},
            {"game_process_ticks", state.frames}, {"bridge_uptime_ms", state.uptimeMs},
            {"simulated", (state.flags & bridge::Simulated) != 0}, {"bridge_protocol", state.version},
            {"moonloader_worker_ready", (state.flags & bridge::WorkerReady) != 0}};
    } catch (const std::exception& error) {
        return {{"connected", false}, {"error", error.what()}};
    }
}
inline const char* StateName(std::uint32_t state) {
    switch (state) {
    case bridge::Queued: return "queued";
    case bridge::Loading: return "loading";
    case bridge::Loaded: return "loaded";
    case bridge::Failed: return "failed";
    case bridge::Running: return "running";
    case bridge::Completed: return "completed";
    case bridge::Cancelled: return "cancelled";
    case bridge::Cancelling: return "cancelling";
    default: return "unknown";
    }
}
inline json Execute(const std::string& name, const json& arguments, const std::wstring& pipe) {
    if (!arguments.is_object()) throw InvalidArguments("arguments must be an object");
    json data;
    if (name == "gta_get_status") {
        if (!arguments.empty()) throw InvalidArguments("gta_get_status accepts no arguments");
        data = Status(pipe);
    } else {
        bridge::Packet request;
        if (name == "gta_load_script" || name == "gta_run_script") {
            const bool managed = name == "gta_run_script";
            for (const auto& item : arguments.items())
                if (item.key() != "path" && (!managed || (item.key() != "params" && item.key() != "timeout_ms")))
                    throw InvalidArguments("Unexpected script argument: " + item.key());
            if (!arguments.contains("path") || !arguments["path"].is_string())
                throw InvalidArguments("Expected string argument: path");
            if (managed) {
                const auto params = arguments.value("params", json::object());
                if (!params.is_object()) throw InvalidArguments("params must be an object");
                const auto encoded = params.dump();
                if (encoded.size() >= bridge::JsonCapacity) throw InvalidArguments("params exceeds 16383 UTF-8 bytes");
                strcpy_s(request.json, encoded.c_str());
                if (arguments.contains("timeout_ms")) {
                    if (!arguments["timeout_ms"].is_number_integer()) throw InvalidArguments("timeout_ms must be an integer");
                    const auto timeout = arguments["timeout_ms"].get<std::int64_t>();
                    if (timeout < 100 || timeout > 300000) throw InvalidArguments("timeout_ms must be 100..300000");
                    request.timeoutMs = static_cast<std::uint32_t>(timeout);
                }
            }
            const auto path = arguments["path"].get<std::string>();
            if (path.empty() || path.size() >= sizeof(request.path) || path.find('\0') != std::string::npos)
                throw InvalidArguments("path must contain 1..1023 UTF-8 bytes without NUL");
            const auto file = std::filesystem::u8path(path);
            auto extension = file.extension().u8string();
            for (auto& ch : extension) ch = static_cast<char>(std::tolower(static_cast<unsigned char>(ch)));
            if (!file.is_absolute() || extension != ".lua")
                throw InvalidArguments("path must be an absolute .lua filename");
            std::error_code error;
            if (!std::filesystem::is_regular_file(file, error)) {
                data = {{"connected", false}, {"error", "Script file does not exist or cannot be read"}};
            } else {
                request.kind = managed ? bridge::RunRequest : bridge::LoadRequest;
                strcpy_s(request.path, path.c_str());
            }
        } else if (name == "gta_get_command" || name == "gta_stop_script") {
            if (arguments.size() != 1 || !arguments.contains("command_id") || !arguments["command_id"].is_number_integer())
                throw InvalidArguments("Expected a single integer argument: command_id");
            const auto id = arguments["command_id"].get<std::int64_t>();
            if (id < 1 || id > UINT32_MAX) throw InvalidArguments("command_id is out of range");
            request.kind = name == "gta_stop_script" ? bridge::StopRequest : bridge::CommandRequest;
            request.commandId = static_cast<std::uint32_t>(id);
        } else throw InvalidArguments("Unknown tool");
        if (data.is_null()) {
            try {
                const auto response = bridge::Exchange(pipe, request);
                if (response.error) {
                    data = {{"connected", true}, {"error", response.message}, {"bridge_error", response.error}};
                } else {
                    data = {{"connected", true}, {"command_id", response.commandId},
                        {"state", StateName(response.state)}, {"script_id", response.scriptId},
                        {"path", response.path}, {"message", response.message},
                        {"simulated", (response.flags & bridge::Simulated) != 0},
                        {"process_id", response.processId}};
                    if (response.json[0]) {
                        auto payload = json::parse(response.json, nullptr, false);
                        if (payload.is_discarded()) {
                            data["error"] = "Lua returned invalid UTF-8 JSON";
                        } else {
                            data[response.state == bridge::Failed ? "execution_error" : "result"] = std::move(payload);
                        }
                    }
                }
            } catch (const std::exception& error) {
                data = {{"connected", false}, {"error", error.what()}};
            }
        }
    }
    const bool failed = data.contains("error") || data.value("state", "") == "failed";
    return {{"content", json::array({{{"type", "text"}, {"text", data.dump()}}})},
        {"structuredContent", data}, {"isError", failed}};
}
}
