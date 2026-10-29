#include "../shared/BridgeHost.h"
#include <iostream>
#include <stdexcept>

void Require(bool ok) { if (!ok) throw std::runtime_error("Queue test failed"); }
bridge::Packet Enqueue(bridge::Queue& queue) {
    bridge::Packet request;
    request.kind = bridge::LoadRequest;
    strcpy_s(request.path, "C:\\test.lua");
    bridge::Packet response;
    queue.Enqueue(request, response);
    return response;
}
int main() {
    try {
        bridge::Queue queue;
        Require(!queue.WorkerIsReady());
        Require(Enqueue(queue).error == bridge::MissingWorker);
        bridge::LuaCommand command{};
        Require(queue.Poll(&command, sizeof(command) - 1) == -1);
        Require(!queue.WorkerIsReady());
        Require(queue.Poll(&command, sizeof(command)) == 0);
        Require(queue.WorkerIsReady());
        const auto first = Enqueue(queue);
        Require(first.error == 0 && first.state == bridge::Queued);
        Require(queue.Report(first.commandId, true, 10, "premature") == 0);
        Require(queue.Poll(&command, sizeof(command)) == 1);
        Require(command.id == first.commandId && command.operation == bridge::LoadRequest);
        bridge::Packet state;
        queue.Lookup(command.id, state);
        Require(state.state == bridge::Loading);
        Require(queue.Report(command.id, true, 10, "loaded") == 1);
        Require(queue.Report(command.id, false, -1, "duplicate") == 0);
        queue.Lookup(command.id, state);
        Require(state.state == bridge::Loaded && state.scriptId == 10);

        // FIFO and bounded pending queue; a full queue cannot overwrite work.
        std::uint32_t previousId = 0;
        for (int i = 0; i < 64; ++i) {
            const auto result = Enqueue(queue);
            Require(result.error == 0 && result.commandId > previousId);
            previousId = result.commandId;
        }
        Require(Enqueue(queue).error == bridge::QueueFull);
        previousId = 0;
        for (int i = 0; i < 64; ++i) {
            Require(queue.Poll(&command, sizeof(command)) == 1 && command.id > previousId);
            previousId = command.id;
            Require(queue.Report(command.id, false, -1, "failure") == 1);
            queue.Lookup(command.id, state);
            Require(state.state == bridge::Failed);
        }
        Require(queue.Poll(&command, sizeof(command)) == 0);
        // Completed history can be evicted without losing new work.
        for (int i = 0; i < 300; ++i) {
            Require(Enqueue(queue).error == 0);
            Require(queue.Poll(&command, sizeof(command)) == 1);
            Require(queue.Report(command.id, true, i, "ok") == 1);
        }
        state = bridge::Packet{};
        queue.Lookup(first.commandId, state);
        Require(state.error == bridge::UnknownCommand);
        // Managed runs: snapshots, immutable terminal states, cancellation races,
        // bounded payloads and separation from legacy load acknowledgements.
        bridge::Packet run;
        run.kind = bridge::RunRequest;
        strcpy_s(run.path, "C:\\managed.lua");
        strcpy_s(run.json, "{\"samples\":3}");
        bridge::Packet submitted;
        queue.Enqueue(run, submitted);
        Require(submitted.error == 0);
        const auto id = submitted.commandId;
        Require(queue.Poll(&command, sizeof(command)) == 1 && command.operation == bridge::RunRequest);
        Require(std::string(command.json) == run.json && command.timeoutMs == 30000);
        Require(queue.Execution(id, bridge::Running, 42, "{\"step\":1}", 10) == 1);
        queue.Lookup(id, state);
        Require(state.state == bridge::Running && std::string(state.json) == "{\"step\":1}");
        Require(queue.Execution(id, bridge::Completed, 42, "null", 4) == 1);
        Require(queue.Execution(id, bridge::Running, 42, "null", 4) == 0);
        queue.Stop(id, state);
        Require(state.state == bridge::Completed); // Cancellation after completion is idempotent.
        submitted = bridge::Packet{};
        queue.Enqueue(run, submitted);
        queue.Stop(submitted.commandId, state);
        Require(state.state == bridge::Cancelled);
        Require(queue.Poll(&command, sizeof(command)) == 0); // Never execute a cancelled queued run.
        submitted = bridge::Packet{};
        queue.Enqueue(run, submitted);
        Require(queue.Poll(&command, sizeof(command)) == 1);
        queue.Stop(submitted.commandId, state);
        Require(state.state == bridge::Cancelling);
        Require(queue.Execution(submitted.commandId, bridge::Completed, 42, "null", 4) == 0);
        Require(queue.Poll(&command, sizeof(command)) == 1 && command.operation == bridge::StopRequest);
        Require(queue.Execution(command.id, bridge::Cancelled, 42, "null", 4) == 1);
        submitted = bridge::Packet{};
        queue.Enqueue(run, submitted);
        Require(queue.Poll(&command, sizeof(command)) == 1);
        std::string maximum(bridge::JsonCapacity - 1, 'x');
        Require(queue.Execution(command.id, bridge::Running, 42, maximum.c_str(), static_cast<unsigned>(maximum.size())) == 1);
        Require(queue.Execution(command.id, bridge::Running, 42, maximum.c_str(), bridge::JsonCapacity) == -1);
        Require(queue.Execution(command.id, bridge::Failed, 42, "{\"message\":\"failure\"}", 21) == 1);
        std::cout << "PASS: worker heartbeat, ABI validation, FIFO, bounded queue/history, state transitions, duplicate report rejection.\n";
        return 0;
    } catch (const std::exception& error) {
        std::cerr << error.what() << '\n'; return 1;
    }
}
