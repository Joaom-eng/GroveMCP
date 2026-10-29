"""Local mailbox / child-process tests. The Codex backend is explicitly fake."""
import importlib.util
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest import mock

PROJECT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('chat_relay', PROJECT / 'tools' / 'ingame_chat_relay.py')
relay_module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(relay_module)
REAL_POPEN = subprocess.Popen

FAKE = '''import json, pathlib, sys
args = json.loads(sys.argv[1])
prompt = sys.stdin.read()
output = pathlib.Path(args[args.index('--output-last-message') + 1])
print(json.dumps({'type':'thread.started', 'thread_id':'12345678-1234-1234-1234-123456789abc'}), flush=True)
print(json.dumps({'type':'item.started','item':{'type':'mcp_tool_call','tool':'gta_get_status'}}), flush=True)
message = 'Resposta simulada: ação recebida.'
output.write_text(message, encoding='utf-8')
print(json.dumps({'type':'item.completed','item':{'type':'agent_message','text':message}}), flush=True)
print(json.dumps({'type':'turn.completed'}), flush=True)
'''

class ChatRelayTests(unittest.TestCase):
    def setUp(self):
        temporary_root = PROJECT / 'tests' / '.tmp'
        temporary_root.mkdir(exist_ok=True)
        self.temporary = tempfile.TemporaryDirectory(dir=temporary_root)
        self.root = Path(self.temporary.name)
        self.stub = self.root / 'fake_codex.py'
        self.stub.write_text(FAKE, encoding='utf-8')
        self.relay = relay_module.Relay(self.root / 'mailbox', PROJECT, Path(sys.executable), 5)
        self.invocations = []
    def tearDown(self):
        self.temporary.cleanup()
    def popen(self, args, **kwargs):
        self.invocations.append(args)
        return REAL_POPEN([sys.executable, str(self.stub), json.dumps(args)], **kwargs)
    def request(self, identifier, text):
        relay_module.atomic_json(self.relay.mailbox / 'requests' / (identifier + '.json'),
                                 {'id': identifier, 'text': text})
    def response(self, identifier):
        return relay_module.read_json(self.relay.mailbox / 'responses' / (identifier + '.json'))
    def test_round_trip_utf8_session_resume_and_exactly_once(self):
        with mock.patch.object(relay_module.subprocess, 'Popen', self.popen):
            self.request('one', 'Qual é a vida do CJ?')
            self.assertTrue(self.relay.once())
            self.assertEqual(self.response('one')['state'], 'done')
            self.assertIn('ação', self.response('one')['text'])
            self.assertEqual(self.relay.session, '12345678-1234-1234-1234-123456789abc')
            self.request('two', 'Continue a sessão')
            self.relay.once()
            self.assertIn('resume', self.invocations[1])
            self.assertIn(self.relay.session, self.invocations[1])
            self.request('one', 'Uma duplicata não pode executar novamente')
            self.relay.once()
            self.assertEqual(len(self.invocations), 2)
    def test_invalid_or_oversized_messages_never_start_codex(self):
        with mock.patch.object(relay_module.subprocess, 'Popen', self.popen):
            for name, value in [('empty',' '), ('large','á' * 3000), ('wrong_type',17)]:
                self.request(name, value)
                self.relay.once()
                self.assertEqual(self.response(name)['state'], 'error')
            self.assertFalse(self.invocations)
    def test_cancel_before_execution(self):
        self.request('cancel', 'Não executar')
        (self.relay.mailbox / 'cancel_cancel').touch()
        with mock.patch.object(relay_module.subprocess, 'Popen', self.popen):
            self.relay.once()
        self.assertEqual(self.response('cancel')['state'], 'cancelled')
        self.assertFalse(self.invocations)
    def test_singleton_lock_rejects_another_owner(self):
        lock = self.root / 'singleton.lock'
        with relay_module.exclusive_lock(lock):
            with self.assertRaises(OSError):
                with relay_module.exclusive_lock(lock):
                    self.fail('Second relay acquired lock')
    def test_no_shell_and_no_automatic_session_selection(self):
        command = relay_module.command_line('codex.exe', PROJECT, 'known-session', self.root / 'out.txt')
        self.assertIn('--approve-for-me', command)
        self.assertNotIn('--last', command)
        self.assertNotIn('--dangerously-bypass-approvals-and-sandbox', command)

if __name__ == '__main__':
    unittest.main()
