"""Opt-in read-only managed execution checks against an already-running GTA.

Requires the v3 ASI/worker and the installed mcp_execution_test.lua. Submissions
are sent once; transport failures are surfaced rather than retried.
"""
import argparse
import json
import pathlib
import subprocess
import time

parser = argparse.ArgumentParser()
parser.add_argument('--exe', default=str(pathlib.Path(__file__).resolve().parents[1] / 'bin/Host/Release/McpServer.exe'))
parser.add_argument('--script', default=str(pathlib.Path(__file__).resolve().parents[1] / 'moonloader/examples/mcp_execution_test.lua'))
parser.add_argument('--output')
args = parser.parse_args()
process = subprocess.Popen([args.exe, '--stdio'], stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                           stderr=subprocess.PIPE, text=True, encoding='utf-8')
sequence = 0
evidence = {}

def request(method, params):
    global sequence
    sequence += 1
    process.stdin.write(json.dumps({'jsonrpc': '2.0', 'id': sequence, 'method': method, 'params': params}) + '\n')
    process.stdin.flush()
    response = json.loads(process.stdout.readline())
    assert 'error' not in response, response
    return response['result']

def tool(name, arguments=None):
    return request('tools/call', {'name': name, 'arguments': arguments or {}})

def run(mode, timeout=30000):
    response = tool('gta_run_script', {'path': args.script,
        'params': {'mode': mode, 'echo': {'text': 'ação de depuração', 'values': [1, True, None]}},
        'timeout_ms': timeout})
    assert not response['isError'], response
    return response['structuredContent']['command_id']

def until(identifier, predicate):
    deadline = time.monotonic() + 12
    while True:
        response = tool('gta_get_command', {'command_id': identifier})
        state = response['structuredContent']
        assert state.get('connected'), state
        if predicate(state):
            return state
        assert time.monotonic() < deadline, state
        time.sleep(.05)

def terminal(identifier):
    return until(identifier, lambda state: state.get('state') in ('completed', 'failed', 'cancelled'))

try:
    request('initialize', {'protocolVersion': '2025-11-25', 'capabilities': {},
                          'clientInfo': {'name': 'gta-live-runtime-test', 'version': '0.3'}})
    process.stdin.write('{"jsonrpc":"2.0","method":"notifications/initialized"}\n')
    process.stdin.flush()
    status = tool('gta_get_status')['structuredContent']
    assert status.get('connected') and status.get('moonloader_worker_ready') and not status.get('simulated'), status
    evidence['status'] = status
    evidence['success'] = terminal(run('success'))
    assert evidence['success']['state'] == 'completed', evidence['success']
    assert evidence['success']['result']['echo']['text'] == 'ação de depuração'
    assert isinstance(evidence['success']['result']['health'], int)
    for mode in ('error', 'yield_error'):
        state = evidence[mode] = terminal(run(mode))
        assert state['state'] == 'failed', state
        assert 'MCP intentional Lua error' in state['execution_error']['message'], state
        assert 'stack traceback' in state['execution_error']['traceback'], state
    identifier = run('wait')
    evidence['progress'] = until(identifier, lambda state: state.get('state') == 'running'
        and isinstance(state.get('result'), dict) and state['result'].get('phase') == 'waiting')
    tool('gta_stop_script', {'command_id': identifier})
    evidence['cancel'] = terminal(identifier)
    assert evidence['cancel']['state'] == 'cancelled', evidence['cancel']
    for mode in ('wait', 'loop'):
        state = evidence[mode + '_timeout'] = terminal(run(mode, 300))
        assert state['state'] == 'failed' and state['execution_error']['kind'] == 'timeout', state
    evidence['null'] = terminal(run('null'))
    assert evidence['null']['state'] == 'completed' and evidence['null']['result'] is None
    evidence['oversized'] = terminal(run('oversized'))
    assert evidence['oversized']['state'] == 'failed'
    assert evidence['oversized']['execution_error']['kind'] == 'result_error'
    print('PASS: real GTA player query, nested UTF-8 JSON, traceback before/after wait, progress, cancel, waiting/loop timeouts, null and oversize rejection.')
finally:
    if args.output:
        output = pathlib.Path(args.output)
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(json.dumps(evidence, ensure_ascii=False, indent=2), encoding='utf-8')
    process.stdin.close()
    try:
        process.wait(timeout=5)
    except subprocess.TimeoutExpired:
        process.kill()
        process.wait(timeout=5)
