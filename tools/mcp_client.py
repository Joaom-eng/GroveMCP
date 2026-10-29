"""Diagnostic MCP client: python tools/mcp_client.py [--exe PATH] [--load PATH]."""
import argparse
import json
import pathlib
import subprocess
import time

parser = argparse.ArgumentParser()
parser.add_argument('--exe', default=str(pathlib.Path(__file__).resolve().parents[1] / 'bin/Host/Release/McpServer.exe'))
action = parser.add_mutually_exclusive_group()
action.add_argument('--load', help='Queue an ordinary MoonLoader script once')
action.add_argument('--run', help='Execute a managed module returning function(ctx) once')
action.add_argument('--command', type=int, help='Query an existing command without resubmitting')
action.add_argument('--stop', type=int, help='Request cancellation of a managed command')
parser.add_argument('--params', default='{}', help='JSON object passed as ctx.params')
parser.add_argument('--execution-timeout-ms', type=int, default=30000)
parser.add_argument('--wait-result', type=float, default=5, help='Polling duration, not execution timeout')
parser.add_argument('--wait-ready', type=float, default=0, help='Wait up to this many seconds for the MoonLoader worker')
options = parser.parse_args()
process = subprocess.Popen([options.exe, '--stdio'], stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                           stderr=subprocess.PIPE, text=True, encoding='utf-8')
sequence = 0


def request(method, params):
    global sequence
    sequence += 1
    process.stdin.write(json.dumps({'jsonrpc': '2.0', 'id': sequence, 'method': method, 'params': params}) + '\n')
    process.stdin.flush()
    response = json.loads(process.stdout.readline())
    if 'error' in response:
        raise RuntimeError(response['error'])
    return response['result']


def tool(name, arguments=None):
    return request('tools/call', {'name': name, 'arguments': arguments or {}})


try:
    initialized = request('initialize', {'protocolVersion': '2025-11-25', 'capabilities': {},
                                        'clientInfo': {'name': 'gta-sa-diagnostic', 'version': '0.2.0'}})
    process.stdin.write(json.dumps({'jsonrpc': '2.0', 'method': 'notifications/initialized'}) + '\n')
    process.stdin.flush()
    tools = request('tools/list', {})['tools']
    status = tool('gta_get_status')
    ready_deadline = time.monotonic() + options.wait_ready
    while options.wait_ready > 0 and not status['structuredContent'].get('moonloader_worker_ready') and time.monotonic() < ready_deadline:
        time.sleep(.5)
        status = tool('gta_get_status')
    output = {'server': initialized['serverInfo'], 'tools': [item['name'] for item in tools], 'status': status['structuredContent']}
    if options.load or options.run or options.command or options.stop:
        if options.run:
            result = tool('gta_run_script', {'path': options.run, 'params': json.loads(options.params),
                                           'timeout_ms': options.execution_timeout_ms})
        elif options.load:
            result = tool('gta_load_script', {'path': options.load})
        else:
            result = tool('gta_stop_script' if options.stop else 'gta_get_command',
                          {'command_id': options.stop or options.command})
        output['submission'] = result
        if not result['isError']:
            command_id = result['structuredContent']['command_id']
            deadline = time.monotonic() + options.wait_result
            while time.monotonic() < deadline:
                result = tool('gta_get_command', {'command_id': command_id})
                output['command'] = result
                if result['isError'] or result['structuredContent']['state'] in ('loaded', 'failed', 'completed', 'cancelled'):
                    break
                time.sleep(.1)
    print(json.dumps(output, indent=2, ensure_ascii=True))
finally:
    process.stdin.close()
    try:
        process.wait(timeout=5)
    except subprocess.TimeoutExpired:
        process.kill()
        process.wait(timeout=5)
