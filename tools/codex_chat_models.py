"""Read the local Codex app-server model catalog; never reads auth.json."""
import json
import queue
import subprocess
import threading
import time

def request(codex, method, params=None, timeout=20, stop_event=None):
    process = subprocess.Popen([str(codex), 'app-server'], stdin=subprocess.PIPE,
        stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, text=True, encoding='utf-8',
        creationflags=getattr(subprocess, 'CREATE_NO_WINDOW', 0))
    replies = queue.Queue()
    def reader():
        for line in process.stdout:
            try: replies.put(json.loads(line))
            except json.JSONDecodeError: pass
    thread = threading.Thread(target=reader, daemon=True)
    thread.start()
    def send(message):
        process.stdin.write(json.dumps(message) + '\n'); process.stdin.flush()
    deadline = time.monotonic() + timeout
    try:
        send({'id':1,'method':'initialize','params':{'clientInfo':{'name':'gta_chat_catalog','version':'0.1'}}})
        while time.monotonic() < deadline:
            if stop_event is not None and stop_event.is_set():
                raise InterruptedError('Codex metadata request cancelled')
            try: message = replies.get(timeout=.2)
            except queue.Empty: continue
            if message.get('id') == 1:
                if 'error' in message: raise RuntimeError(message['error'])
                send({'method':'initialized','params':{}})
                call = {'id':2,'method':method}
                if params is not None:
                    call['params'] = params
                send(call)
            if message.get('id') == 2:
                if 'error' in message: raise RuntimeError(message['error'])
                return message['result']
            if process.poll() is not None:
                raise RuntimeError('Codex app-server exited before replying')
        raise TimeoutError('Codex metadata request timed out')
    finally:
        process.stdin.close()
        try: process.wait(timeout=3)
        except subprocess.TimeoutExpired: process.terminate(); process.wait(timeout=3)
        thread.join(timeout=1)
        process.stdout.close()

def models(codex, timeout=20):
    return request(codex, 'model/list', {'limit':100,'includeHidden':False}, timeout)['data']

if __name__ == '__main__':
    import shutil
    print(json.dumps([{'model': m['model'], 'isDefault':m.get('isDefault'),
        'defaultReasoningEffort':m.get('defaultReasoningEffort')} for m in models(shutil.which('codex'))], indent=2))
