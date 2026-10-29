"""Integration tests of the actual executable and shared ASI pipe implementation.

The test host runs the same Host class as the ASI, on a unique non-game pipe.
This does not substitute for testing inside GTA.
"""
import json
import ctypes
import pathlib
import struct
import subprocess
import sys
import threading
import tempfile
import time
import uuid

EXE = str(pathlib.Path(sys.argv[1]).resolve()) if len(sys.argv) > 1 else str(
    pathlib.Path(__file__).resolve().parents[1] / 'bin/Host/Release/McpServer.exe')
PIPE = 'McpServer.Test.' + uuid.uuid4().hex
PACKET_FORMAT = '<IIIIIIQQIIiI1024s512sI16384s'
PACKET_SIZE = struct.calcsize(PACKET_FORMAT)
TEST_TEMP = pathlib.Path(__file__).resolve().parent / '.tmp'
TEST_TEMP.mkdir(exist_ok=True)


def probe():
    result = subprocess.run([EXE, '--probe', '--pipe', PIPE], capture_output=True,
                            text=True, timeout=5)
    return result.returncode, json.loads(result.stdout)


def wait_connected(expected):
    deadline = time.monotonic() + 5
    while time.monotonic() < deadline:
        code, state = probe()
        if state['connected'] is expected:
            return code, state
        time.sleep(.03)
    raise AssertionError(('connection did not reach expected state', expected, state))


def open_pipe():
    for _ in range(100):
        try:
            return open('\\\\.\\pipe\\' + PIPE, 'r+b', buffering=0)
        except OSError:
            time.sleep(.01)
    raise AssertionError('Could not open test pipe')


class Client:
    def __init__(self):
        self.proc = subprocess.Popen([EXE, '--pipe', PIPE], stdin=subprocess.PIPE,
                                     stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, encoding='utf-8')

    def send(self, method, params=None, request_id=None):
        request = {'jsonrpc': '2.0', 'method': method}
        if params is not None:
            request['params'] = params
        if request_id is not None:
            request['id'] = request_id
        self.proc.stdin.write(json.dumps(request) + '\n')
        self.proc.stdin.flush()

    def read(self):
        return json.loads(self.proc.stdout.readline())

    def initialize(self):
        self.send('initialize', {'protocolVersion': '2025-11-25', 'capabilities': {},
                                'clientInfo': {'name': 'integration-test', 'version': '1'}}, 1)
        result = self.read()
        assert result['result']['protocolVersion'] == '2025-11-25'
        self.send('notifications/initialized')

    def close(self):
        self.proc.stdin.close()
        assert self.proc.wait(timeout=5) == 0
        assert self.proc.stderr.read() == ''

    def tool(self, name, arguments=None):
        self.send('tools/call', {'name': name, 'arguments': arguments or {}}, 'tool')
        return self.read()


host = None
clients = []
try:
    code, state = probe()
    assert code == 1 and state['connected'] is False
    host = subprocess.Popen([EXE, '--test-bridge-host', '--pipe', PIPE],
                            stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    code, state = wait_connected(True)
    assert code == 0 and state['simulated'] is True and state['process_id'] == host.pid
    first_ticks = state['game_process_ticks']
    time.sleep(.05)
    _, next_state = probe()
    assert next_state['game_process_ticks'] > first_ticks

    # Byte pipes do not preserve packet boundaries: exercise fragmented input.
    packet = struct.pack(PACKET_FORMAT, 0x5341434D, 3, 1, 99, 0, 0, 0, 0, 0, 0, -1, 0, b'', b'', 30000, b'')
    with open_pipe() as raw:
        raw.write(packet[:7])
        time.sleep(.03)
        raw.write(packet[7:])
        reply = bytearray()
        while len(reply) < PACKET_SIZE:
            reply.extend(raw.read(PACKET_SIZE - len(reply)))
        assert struct.unpack(PACKET_FORMAT, reply)[2:4] == (2, 99)
    with open_pipe() as raw:
        raw.write(bytes(PACKET_SIZE))  # Invalid magic must not poison the next connection.
    wait_connected(True)

    # Restart executable/client while the bridge host remains alive.
    for _ in range(3):
        client = Client()
        clients.append(client)
        client.initialize()
        client.send('tools/list', {}, 2)
        assert client.read()['result']['tools'][0]['name'] == 'gta_get_status'
        client.send('tools/call', {'name': 'gta_get_status', 'arguments': {}}, 'status')
        result = client.read()
        assert result['id'] == 'status'
        assert result['result']['isError'] is False
        assert result['result']['structuredContent']['process_id'] == host.pid
        client.close()

    # Keep one MCP client alive across bridge shutdown and restart.
    client = Client()
    clients.append(client)
    client.initialize()
    host.terminate()
    host.wait(timeout=5)
    host = None
    wait_connected(False)
    client.send('tools/call', {'name': 'gta_get_status'}, 3)
    assert client.read()['result']['isError'] is True
    host = subprocess.Popen([EXE, '--test-bridge-host', '--pipe', PIPE],
                            stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    wait_connected(True)
    client.send('tools/call', {'name': 'gta_get_status'}, 4)
    assert client.read()['result']['structuredContent']['connected'] is True

    # Invalid inputs, unknown methods, notifications and parser recovery.
    client.send('tools/call', {'name': 'unknown'}, 5)
    assert client.read()['error']['code'] == -32602
    client.send('tools/call', {'name': 'gta_get_status', 'arguments': {'bad': 1}}, 6)
    assert client.read()['error']['code'] == -32602
    client.send('unknown/method', {}, 7)
    assert client.read()['error']['code'] == -32601
    client.send('notifications/anything')
    client.send('ping', {}, 8)
    assert client.read()['id'] == 8  # No extra notification response.
    for invalid, code in [('bad json', -32700), ('[]', -32600), ('x' * (1024 * 1024 + 1), -32700)]:
        client.proc.stdin.write(invalid + '\n')
        client.proc.stdin.flush()
        assert client.read()['error']['code'] == code
    client.send('ping', {}, 9)
    assert client.read()['id'] == 9
    client.close()

    # Exercise the queue over MCP/IPC. The worker here is explicitly simulated.
    host.terminate()
    host.wait(timeout=5)
    host = subprocess.Popen([EXE, '--test-worker-host', '--pipe', PIPE],
                            stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    wait_connected(True)
    client = Client()
    clients.append(client)
    client.initialize()
    assert client.tool('gta_get_status')['result']['structuredContent']['moonloader_worker_ready']
    with tempfile.TemporaryDirectory(dir=TEST_TEMP) as temporary:
        for filename, expected in [('hello.lua', 'loaded'), ('fail.lua', 'failed')]:
            path = pathlib.Path(temporary) / filename
            path.write_text('function main() end', encoding='utf-8')
            queued = client.tool('gta_load_script', {'path': str(path)})['result']
            assert not queued['isError'], queued
            command = queued['structuredContent']
            assert command['state'] == 'queued' and command['simulated']
            deadline = time.monotonic() + 3
            while True:
                result = client.tool('gta_get_command', {'command_id': command['command_id']})['result']
                state = result['structuredContent']
                if state['state'] in ('loaded', 'failed'):
                    break
                assert time.monotonic() < deadline
                time.sleep(.02)
            assert state['state'] == expected
            assert result['isError'] == (expected == 'failed')
            assert 'SIMULATED' in state['message']
            assert state['script_id'] == (123 if expected == 'loaded' else -1)
        for filename, expected in [('managed.lua', 'completed'), ('fail.lua', 'failed')]:
            path = pathlib.Path(temporary) / filename
            path.write_text('return function(ctx) return ctx.params end', encoding='utf-8')
            payload = {'nested': {'value': [1, True, 'ação']}, 'large': 'x' * 12000}
            queued = client.tool('gta_run_script', {'path': str(path), 'params': payload})['result']
            assert not queued['isError'], queued
            identifier = queued['structuredContent']['command_id']
            deadline = time.monotonic() + 5
            while True:
                result = client.tool('gta_get_command', {'command_id': identifier})['result']
                state = result['structuredContent']
                if state.get('state') in ('completed', 'failed'):
                    break
                assert time.monotonic() < deadline
                time.sleep(.02)
            assert state['state'] == expected, state
            assert result['isError'] == (expected == 'failed')
            if expected == 'completed':
                assert state['result']['params'] == payload
            else:
                assert state['execution_error']['message'] == 'SIMULATED execution failure'
        for invalid in [{'params': []}, {'timeout_ms': 0}, {'timeout_ms': 1.5},
                        {'params': {'oversized': 'x' * 17000}}, {'unknown': True}]:
            args = {'path': str(path), **invalid}
            assert client.tool('gta_run_script', args)['error']['code'] == -32602, args
        assert client.tool('gta_stop_script', {'command_id': identifier})['result']['structuredContent']['state'] == 'failed'
        assert client.tool('gta_load_script', {'path': 'relative.lua'})['error']['code'] == -32602
        assert client.tool('gta_load_script', {'path': str(pathlib.Path(temporary) / 'missing.lua')})['result']['isError']
        assert client.tool('gta_get_command', {'command_id': -1})['error']['code'] == -32602
        assert client.tool('gta_get_command', {'command_id': 4294967295})['result']['isError']
    client.close()

    host.terminate()
    host.wait(timeout=5)
    host = subprocess.Popen([EXE, '--test-bridge-host', '--pipe', PIPE],
                            stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    wait_connected(True)
    client = Client()
    clients.append(client)
    client.initialize()
    with tempfile.TemporaryDirectory(dir=TEST_TEMP) as temporary:
        path = pathlib.Path(temporary) / 'hello.lua'
        path.write_text('function main() end', encoding='utf-8')
        result = client.tool('gta_load_script', {'path': str(path)})['result']
        assert result['isError'] and result['structuredContent']['bridge_error'] == 1
    client.close()

    # A connected but non-responsive peer must hit the deadline and release I/O.
    stalled_name = PIPE + '.Stalled'
    kernel = ctypes.WinDLL('kernel32', use_last_error=True)
    kernel.CreateNamedPipeW.argtypes = [ctypes.c_wchar_p] + [ctypes.c_uint32] * 6 + [ctypes.c_void_p]
    kernel.CreateNamedPipeW.restype = ctypes.c_void_p
    kernel.ConnectNamedPipe.argtypes = [ctypes.c_void_p, ctypes.c_void_p]
    kernel.CloseHandle.argtypes = [ctypes.c_void_p]
    stalled = kernel.CreateNamedPipeW('\\\\.\\pipe\\' + stalled_name, 3, 8, 1, 4096, 4096, 0, None)
    assert stalled not in (None, ctypes.c_void_p(-1).value)
    release = threading.Event()

    def stall():
        kernel.ConnectNamedPipe(stalled, None)
        release.wait(5)
        kernel.CloseHandle(stalled)

    worker = threading.Thread(target=stall)
    worker.start()
    try:
        started = time.monotonic()
        stalled_result = subprocess.run([EXE, '--probe', '--pipe', stalled_name],
                                        capture_output=True, text=True, timeout=5)
        assert stalled_result.returncode == 1
        assert '1460' in json.loads(stalled_result.stdout)['error']  # ERROR_TIMEOUT
        assert time.monotonic() - started < 4
    finally:
        release.set()
        worker.join(timeout=6)
    print('PASS: IPC, fragmentation, telemetry, MCP handshake/tools, reconnect, timeout, malformed input, queue, worker absent, load success/failure (simulated), command lookup and path validation.')
finally:
    for client in clients:
        if client.proc.poll() is None:
            client.proc.kill()
            client.proc.wait(timeout=5)
    if host is not None:
        host.terminate()
        host.wait(timeout=5)
