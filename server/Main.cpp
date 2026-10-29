#include "Tools.h"
#include <nlohmann/json.hpp>
#include <iostream>
#include <string>

using json = nlohmann::json;

namespace {
json Error(const json& id, int code, const std::string& message) {
    return {{"jsonrpc", "2.0"}, {"id", id}, {"error", {{"code", code}, {"message", message}}}};
}

void Send(const json& message) { std::cout << message.dump() << '\n' << std::flush; }

// Consume oversized lines without growing the buffer indefinitely.
bool ReadMessage(std::string& line, bool& oversized) {
    line.clear();
    oversized = false;
    char ch;
    bool any = false;
    while (std::cin.get(ch)) {
        any = true;
        if (ch == '\n') break;
        if (line.size() < 1024 * 1024) line.push_back(ch);
        else oversized = true;
    }
    return any;
}

void Serve(const std::wstring& pipe) {
    bool initializing = false;
    bool ready = false;
    std::string line;
    bool oversized;
    while (ReadMessage(line, oversized)) {
        if (oversized) { Send(Error(nullptr, -32700, "Message exceeds 1 MiB")); continue; }
        json message = json::parse(line, nullptr, false);
        if (message.is_discarded()) { Send(Error(nullptr, -32700, "Parse error")); continue; }
        if (!message.is_object() || message.value("jsonrpc", json()) != "2.0" ||
            !message.contains("method") || !message["method"].is_string()) {
            Send(Error(nullptr, -32600, "Invalid Request"));
            continue;
        }
        const bool notification = !message.contains("id");
        const json id = notification ? json(nullptr) : message["id"];
        if (!notification && !id.is_string() && !id.is_number_integer()) {
            Send(Error(nullptr, -32600, "Invalid request id"));
            continue;
        }
        const std::string method = message["method"].get<std::string>();
        const json params = message.value("params", json::object());
        if (!params.is_object()) {
            if (!notification) Send(Error(id, -32602, "params must be an object"));
            continue;
        }
        if (notification) {
            if (method == "notifications/initialized" && initializing) ready = true;
            continue; // Notifications never receive responses.
        }
        json result;
        if (method == "ping") {
            result = json::object();
        } else if (method == "initialize") {
            if (initializing) { Send(Error(id, -32600, "Already initialized")); continue; }
            if (!params.contains("protocolVersion") || !params["protocolVersion"].is_string() ||
                !params.contains("capabilities") || !params["capabilities"].is_object() ||
                !params.contains("clientInfo") || !params["clientInfo"].is_object()) {
                Send(Error(id, -32602, "Missing initialization parameters")); continue;
            }
            // Deliberately implement the 2025-11-25 handshake, not draft/newer revisions.
            result = {{"protocolVersion", "2025-11-25"},
                {"capabilities", {{"tools", json::object()}}},
                {"serverInfo", {{"name", "gta-sa-mcp"}, {"version", "0.3.0"}}},
                {"instructions", "Check gta_get_status first. gta_load_script loads ordinary MoonLoader scripts; gta_run_script executes modules returning function(ctx) with JSON results. Query gta_get_command for progress, completion or traceback. Never automatically retry a timed-out submission."}};
            initializing = true;
        } else if (!ready) {
            Send(Error(id, -32600, "Initialize and send notifications/initialized first")); continue;
        } else if (method == "tools/list") {
            result = {{"tools", mcp::Tools()}};
        } else if (method == "tools/call") {
            if (!params.contains("name") || !params["name"].is_string()) {
                Send(Error(id, -32602, "Tool name must be a string")); continue;
            }
            try {
                result = mcp::Execute(params["name"].get<std::string>(), params.value("arguments", json::object()), pipe);
            } catch (const mcp::InvalidArguments& error) {
                Send(Error(id, -32602, error.what())); continue;
            } catch (const std::exception& error) {
                result = {{"content", json::array({{{"type", "text"}, {"text", error.what()}}})}, {"isError", true}};
            }
        } else {
            Send(Error(id, -32601, "Method not found")); continue;
        }
        Send({{"jsonrpc", "2.0"}, {"id", id}, {"result", result}});
    }
}
}

int main(int argc, char** argv) {
    std::wstring pipe = bridge::PipeName;
    std::string mode = "--stdio";
    for (int index = 1; index < argc; ++index) {
        const std::string arg = argv[index];
        if (arg == "--pipe" && index + 1 < argc) {
            const std::string name = argv[++index];
            if (name.empty() || name.find_first_not_of("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789._-") != std::string::npos) {
                std::cerr << "Invalid pipe name\n"; return 2;
            }
            pipe = L"\\\\.\\pipe\\" + std::wstring(name.begin(), name.end());
        } else if (arg == "--stdio" || arg == "--probe" || arg == "--test-bridge-host" || arg == "--test-worker-host") {
            mode = arg;
        } else {
            std::cerr << "Usage: McpServer.exe [--stdio|--probe|--test-bridge-host|--test-worker-host] [--pipe NAME]\n";
            return 2;
        }
    }
    if (mode == "--test-bridge-host" || mode == "--test-worker-host") {
        // Never impersonate a game bridge on the production pipe.
        if (pipe == bridge::PipeName) {
            std::cerr << "Test host requires a separate --pipe NAME\n"; return 2;
        }
        bridge::Host host(pipe, true);
        std::cerr << "SIMULATED bridge host. Ctrl+C to exit.\n";
        std::uint64_t ticks = 0;
        for (;;) {
            if (mode == "--test-worker-host") {
                bridge::LuaCommand command{};
                if (host.Commands().Poll(&command, sizeof(command)) == 1) {
                    const bool success = std::string(command.path).find("fail.lua") == std::string::npos;
                    if (command.operation == bridge::RunRequest) {
                        const auto result = success ? json{{"simulated", true}, {"params", json::parse(command.json)}}.dump()
                            : json{{"message", "SIMULATED execution failure"}}.dump();
                        host.Commands().Execution(command.id, success ? bridge::Completed : bridge::Failed, 123,
                            result.c_str(), static_cast<std::uint32_t>(result.size()));
                    } else if (command.operation == bridge::StopRequest) {
                        host.Commands().Execution(command.id, bridge::Cancelled, 123, "null", 4);
                    } else host.Commands().Report(command.id, success, success ? 123 : -1,
                        "SIMULATED result: no Lua code was executed");
                }
            }
            host.Tick(++ticks);
            if (host.LastError() != ERROR_SUCCESS) return 2;
            Sleep(5);
        }
    }
    if (mode == "--probe") {
        const auto status = mcp::Status(pipe);
        std::cout << status.dump(2) << '\n';
        return status["connected"].get<bool>() ? 0 : 1;
    }
    try { Serve(pipe); }
    catch (const std::exception& error) { std::cerr << error.what() << '\n'; return 1; }
    return 0;
}
