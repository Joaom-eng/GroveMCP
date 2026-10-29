"""Experimental ImGui <-> local Codex CLI relay. No API key or HTTP listener.

Each message is claimed once from a local mailbox. Codex owns its authentication
and model configuration. This creates/resumes a dedicated session, never edits
the desktop chat history. Game actions are performed through the configured MCP.
"""
import argparse
import contextlib
import json
import os
from pathlib import Path
import queue
import re
import shutil
import signal
import subprocess
import threading
import time

VALID_ID = re.compile(r'^[A-Za-z0-9_-]{1,80}$')
NO_WINDOW = getattr(subprocess, 'CREATE_NO_WINDOW', 0)
BOOTSTRAP = '''Você é o assistente do painel experimental dentro do GTA San Andreas.
Responda em português, de forma breve, adequada a um painel ImGui.
Esta é uma sessão própria, não a conversa original do desktop. O usuário está
digitando pessoalmente no jogo. Seu projeto é o diretório de trabalho atual:
um MCP local em C++, ASI e MoonLoader. Leia AGENTS.md e consulte a documentação
offline em docs/moonloader quando precisar escrever Lua ou usar eventos.
As ferramentas do servidor gta_sa já estão configuradas. Consulte gta_get_status
antes de operar no jogo. gta_run_script aceita um caminho absoluto para um módulo
que retorna function(ctx), permite ctx.publish e retorno JSON. Consulte
gta_get_command; nunca reenvie automaticamente uma submissão após timeout.
Scripts convencionais de eventos usam gta_load_script. Os exemplos estão em
moonloader/examples. Grave novos scripts ali e passe o caminho absoluto ao MCP;
não é necessário alterar o ASI nem reiniciar o jogo. Lua deve ser compatível com
LuaJIT 32 bits. O caminho do jogo será informado junto de cada consulta.
Faça somente o que a mensagem do usuário solicitar. Não altere este relay/painel
para responder a mensagens comuns. Não envie mensagens a outros chats nem
modifique configurações de autenticação. Não exponha credenciais. Se uma ação
for bloqueada, explique brevemente no painel, sem tentar contornar o bloqueio.
Mensagem do usuário:
'''

def atomic_json(path, value):
    data = json.dumps(value, ensure_ascii=False, separators=(',', ':'))
    temporary = path.with_name(path.name + '.tmp')
    temporary.write_text(data, encoding='utf-8')
    # A game read can briefly hold the destination on Windows. Retry the local
    # replace, not the submitted AI/game action.
    for attempt in range(20):
        try:
            os.replace(temporary, path)
            return
        except PermissionError:
            if attempt == 19:
                raise
            time.sleep(.01)

def read_json(path):
    if path.stat().st_size > 256 * 1024:
        raise ValueError('Mailbox file exceeds 256 KiB')
    return json.loads(path.read_text(encoding='utf-8-sig'))

def command_line(codex, project, session, output, model=None, effort=None):
    command = [str(codex), 'exec', '--json', '--skip-git-repo-check', '--color', 'never',
               '--cd', str(project), '--approve-for-me']
    if model:
        command += ['--model', model]
    if effort:
        command += ['-c', 'model_reasoning_effort=' + json.dumps(effort)]
    if session:
        command += ['resume', session]
    command += ['--output-last-message', str(output), '-']
    return command

def terminate_tree(process):
    if process.poll() is not None:
        return
    if os.name == 'nt':
        subprocess.run(['taskkill', '/PID', str(process.pid), '/T', '/F'],
                       stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                       creationflags=NO_WINDOW, timeout=15, check=False)
    else:
        process.terminate()
    try:
        process.wait(timeout=5)
    except subprocess.TimeoutExpired:
        process.kill()
        process.wait(timeout=5)

class Relay:
    def __init__(self, mailbox, project, codex, timeout=300, model=None, effort=None):
        self.mailbox, self.project, self.codex, self.timeout = mailbox, project, codex, timeout
        self.stopping, self.active, self.last_heartbeat = False, None, 0
        self.model, self.effort = model, effort
        for folder in ('requests', 'processing', 'responses'):
            (mailbox / folder).mkdir(parents=True, exist_ok=True)
        self.session_path = mailbox / 'session.json'
        self.session = read_json(self.session_path).get('thread_id') if self.session_path.exists() else None

    def status(self, detail='Pronto para receber mensagens', busy=False, force=False):
        if force or time.time() - self.last_heartbeat >= 1:
            atomic_json(self.mailbox / 'status.json', {
                'version': 1, 'backend': 'Codex CLI / sessão dedicada', 'pid': os.getpid(),
                'heartbeat': int(time.time()), 'busy': busy, 'detail': detail,
                'request_id': self.active, 'thread_id': self.session, 'model': self.model})
            self.last_heartbeat = time.time()

    def respond(self, identifier, state, text='', detail=''):
        atomic_json(self.mailbox / 'responses' / (identifier + '.json'), {
            'id': identifier, 'state': state, 'text': text, 'detail': detail,
            'updated_at': int(time.time()), 'thread_id': self.session})

    def cancelled(self, identifier):
        return (self.mailbox / ('cancel_' + identifier)).exists()

    def execute(self, identifier, message):
        self.active = identifier
        self.respond(identifier, 'running', detail='Consultando o Codex...')
        self.status('Consultando o Codex...', True, True)
        output = self.mailbox / 'responses' / (identifier + '.txt')
        error_log = self.mailbox / 'relay-stderr.log'
        prompt = (BOOTSTRAP if not self.session else '') + (
            '\nDiretório de trabalho desta consulta: ' + str(self.project) +
            '\nPasta do jogo: ' + str(self.mailbox.parent.parent) +
            '\nUse esse caminho para ler a documentação e gravar scripts; '
            'não reutilize um diretório de trabalho de consultas anteriores.\n'
            'Mensagem do usuário:\n' + message)
        process, reader = None, None
        try:
            with error_log.open('w', encoding='utf-8') as errors:
                process = subprocess.Popen(command_line(self.codex, self.project, self.session, output, self.model, self.effort),
                    cwd=self.project, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=errors,
                    text=True, encoding='utf-8', errors='replace', creationflags=NO_WINDOW)
                process.stdin.write(prompt)
                process.stdin.close()
                lines = queue.Queue()
                def read_events():
                    for line in process.stdout:
                        lines.put(line)
                    lines.put(None)
                reader = threading.Thread(target=read_events, daemon=True)
                reader.start()
                started, detail, done = time.monotonic(), 'Consultando o Codex...', False
                last_text, turn_error = '', ''
                while not done:
                    if self.stopping or self.cancelled(identifier):
                        terminate_tree(process)
                        self.respond(identifier, 'cancelled', detail='Resposta cancelada; ações já executadas não são desfeitas.')
                        return
                    if time.monotonic() - started > self.timeout:
                        terminate_tree(process)
                        self.respond(identifier, 'error', detail='Tempo limite do Codex excedido. A mensagem não foi reenviada.')
                        return
                    self.status(detail, True)
                    try:
                        line = lines.get(timeout=.15)
                    except queue.Empty:
                        continue
                    if line is None:
                        done = True
                        continue
                    try:
                        event = json.loads(line)
                    except json.JSONDecodeError:
                        continue
                    if event.get('type') == 'thread.started':
                        session = event.get('thread_id')
                        if isinstance(session, str) and re.fullmatch(r'[0-9a-fA-F-]{36}', session):
                            self.session = session
                            atomic_json(self.session_path, {'thread_id': session})
                    item = event.get('item', {})
                    if item.get('type') == 'agent_message' and item.get('text'):
                        last_text = item['text']
                        detail = 'Preparando resposta...'
                    elif item.get('type') == 'mcp_tool_call':
                        detail = 'Ferramenta: ' + str(item.get('tool', item.get('tool_name', 'MCP')))[:100]
                    elif item.get('type') == 'command_execution':
                        detail = 'Executando uma etapa local...'
                    if event.get('type') in ('turn.failed', 'error'):
                        error = event.get('error', event)
                        turn_error = str(error.get('message', 'Falha no Codex')) if isinstance(error, dict) else str(error)
                code = process.wait(timeout=10)
            text = output.read_text(encoding='utf-8').strip() if output.exists() else last_text.strip()
            if code or turn_error or not text:
                diagnostic = turn_error or error_log.read_text(encoding='utf-8', errors='replace')[-1800:]
                self.respond(identifier, 'error', detail=diagnostic or f'Codex encerrou com código {code}, sem resposta.')
            else:
                self.respond(identifier, 'done', text=text[:32000], detail='Resposta recebida')
        except Exception as error:
            self.respond(identifier, 'error', detail=str(error)[:1800])
        finally:
            if process is not None:
                terminate_tree(process)
                if reader is not None:
                    reader.join(timeout=2)
                if process.stdout is not None:
                    process.stdout.close()
            self.active = None

    def once(self):
        for path in sorted((self.mailbox / 'requests').glob('*.json'), key=lambda p: p.stat().st_mtime):
            identifier = path.stem
            if not VALID_ID.fullmatch(identifier):
                continue
            response = self.mailbox / 'responses' / (identifier + '.json')
            if response.exists():
                # A duplicate ID is never sent to Codex a second time.
                path.unlink()
                continue
            claimed = self.mailbox / 'processing' / path.name
            try:
                os.replace(path, claimed)
                data = read_json(claimed)
                message = data.get('text')
                if data.get('id') != identifier or not isinstance(message, str) or not message.strip():
                    raise ValueError('Mensagem inválida')
                if len(message.encode('utf-8')) > 4095:
                    raise ValueError('Mensagem excede 4095 bytes')
                if time.time() - claimed.stat().st_mtime > 600:
                    raise ValueError('Mensagem antiga; não executada automaticamente')
                if self.cancelled(identifier):
                    self.respond(identifier, 'cancelled', detail='Cancelada antes de enviar ao Codex')
                else:
                    self.execute(identifier, message.strip())
            except Exception as error:
                self.respond(identifier, 'error', detail=str(error)[:1800])
            finally:
                claimed.unlink(missing_ok=True)
            return True
        return False

    def serve(self):
        # A crashed relay leaves an uncertain request; do not replay game actions.
        for path in (self.mailbox / 'processing').glob('*.json'):
            if VALID_ID.fullmatch(path.stem):
                self.respond(path.stem, 'error', detail='Relay interrompido. Execução anterior incerta; não reenviada.')
                path.unlink()
        self.status(force=True)
        # Quota metadata is fetched without inference, independently of chat turns.
        # A slow/unavailable account service must not block heartbeats or the UI.
        usage_stop = threading.Event()
        def update_usage():
            from codex_chat_usage import read_usage
            previous = {}
            while not usage_stop.is_set():
                try:
                    snapshot = read_usage(self.codex, usage_stop)
                    previous = snapshot
                except InterruptedError:
                    return
                except Exception:
                    snapshot = dict(previous, state='stale' if previous else 'unavailable',
                                    checked_at=int(time.time()))
                if not usage_stop.is_set():
                    try:
                        atomic_json(self.mailbox / 'usage.json', snapshot)
                    except OSError:
                        pass  # Keep chat operational if a metadata write fails.
                usage_stop.wait(60)
        usage_thread = threading.Thread(target=update_usage, daemon=True)
        usage_thread.start()
        try:
            while not self.stopping and not (self.mailbox / 'relay.stop').exists():
                self.once()
                self.status()
                time.sleep(.15)
        finally:
            usage_stop.set()
            usage_thread.join(timeout=5)
            self.status('Relay encerrado', force=True)

@contextlib.contextmanager
def exclusive_lock(path):
    with path.open('a+b') as handle:
        if path.stat().st_size == 0:
            handle.write(b'0'); handle.flush()
        handle.seek(0)
        if os.name == 'nt':
            import msvcrt
            msvcrt.locking(handle.fileno(), msvcrt.LK_NBLCK, 1)
        else:
            import fcntl
            fcntl.flock(handle, fcntl.LOCK_EX | fcntl.LOCK_NB)
        try:
            yield
        finally:
            handle.seek(0)
            if os.name == 'nt':
                msvcrt.locking(handle.fileno(), msvcrt.LK_UNLCK, 1)
            else:
                fcntl.flock(handle, fcntl.LOCK_UN)

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--mailbox', type=Path, required=True)
    parser.add_argument('--project', type=Path, default=Path(__file__).resolve().parents[1])
    parser.add_argument('--codex', type=Path)
    parser.add_argument('--timeout', type=int, default=300)
    parser.add_argument('--model', help='Optional model; otherwise use model/list isDefault from the local CLI')
    args = parser.parse_args()
    codex = args.codex or shutil.which('codex')
    if not codex or not Path(codex).is_file():
        parser.error('Codex CLI não encontrado; informe --codex')
    args.mailbox.mkdir(parents=True, exist_ok=True)
    with exclusive_lock(args.mailbox / 'relay.lock'):
        (args.mailbox / 'relay.stop').unlink(missing_ok=True)
        from codex_chat_models import models
        catalog = models(codex)
        selected = next((m for m in catalog if m['model'] == args.model), None) if args.model else next((m for m in catalog if m.get('isDefault')), None)
        if selected is None:
            parser.error('Modelo indisponível no catálogo local do Codex')
        relay = Relay(args.mailbox, args.project.resolve(), Path(codex), args.timeout,
                      selected['model'], selected.get('defaultReasoningEffort'))
        signal.signal(signal.SIGINT, lambda *_: setattr(relay, 'stopping', True))
        signal.signal(signal.SIGTERM, lambda *_: setattr(relay, 'stopping', True))
        relay.serve()

if __name__ == '__main__':
    main()
