"""Offline checks for imported documentation and the HTML-to-Markdown boundary."""
import hashlib
import importlib.util
import json
from pathlib import Path
import unittest

PROJECT = Path(__file__).resolve().parents[1]
ROOT = PROJECT / 'docs' / 'moonloader'
spec = importlib.util.spec_from_file_location('moonloader_docs', PROJECT / 'tools' / 'moonloader_docs.py')
docs = importlib.util.module_from_spec(spec)
spec.loader.exec_module(docs)

class DocsTests(unittest.TestCase):
    def test_text_conversion_preserves_code_and_ignores_active_content(self):
        dom = docs.DOM('<div><h2>Events</h2><script>danger()</script>'
                       '<iframe>advertising</iframe><p><a href="/moonloader/events">Events</a></p>'
                       '<pre><code>function test()\n  print(&quot;ok&quot;)\nend</code></pre></div>')
        text = docs.cleaned(dom.root, docs.WIKI)
        self.assertNotIn('danger()', text)
        self.assertNotIn('advertising', text)
        self.assertIn('function test()\n  print("ok")\nend', text)
        self.assertIn('[Events](https://wiki.blast.hk/moonloader/events)', text)

    def test_event_coverage_has_individual_pages_and_signatures(self):
        events = json.loads((ROOT / 'events.json').read_text(encoding='utf-8'))
        self.assertEqual(len(events), 19)
        names = {event['name'] for event in events}
        self.assertTrue({'main', 'onD3DPresent', 'onD3DDeviceLost', 'onD3DDeviceReset',
                         'onScriptTerminate', 'onExitScript', 'onSystemMessage'} <= names)
        for name in names:
            self.assertTrue((ROOT / 'wiki' / f'moonloader__lua__{name}.md').is_file(), name)

    def test_snapshot_hashes_and_local_index_locations(self):
        manifest = json.loads((ROOT / 'wiki-manifest.json').read_text(encoding='utf-8'))
        self.assertFalse(manifest['unavailable'])
        for source in manifest['sources']:
            path = ROOT / source['local_file']
            self.assertEqual(hashlib.sha256(path.read_bytes()).hexdigest(), source['markdown_sha256'])
        source = json.loads((ROOT / 'raw' / 'moonloader_reference.source.json').read_text(encoding='utf-8-sig'))
        self.assertEqual(hashlib.sha256((ROOT / 'raw' / 'moonloader_reference.lua').read_bytes()).hexdigest(), source['sha256'].lower())
        entries = json.loads((ROOT / 'index.json').read_text(encoding='utf-8'))['entries']
        self.assertTrue(any(entry['name'] == 'getCharCoordinates' and entry.get('opcode') == '00A0' for entry in entries))
        self.assertTrue(any(entry['name'] == 'isCursorActive' and entry['file'].endswith('scripting-api.md') for entry in entries))
        for entry in entries:
            self.assertTrue((ROOT / entry['file']).is_file(), entry)
            self.assertGreater(entry['line'], 0)

    def test_saved_forum_contains_guide_not_other_users_or_ad_scripts(self):
        guide = (ROOT / 'forum-guide.md').read_text(encoding='utf-8')
        self.assertIn('onScriptMessage', guide)
        self.assertIn('wait(-1)', guide)
        self.assertNotIn('doubleclick', guide)
        self.assertNotIn('<script', guide)
        self.assertNotIn('ipsComment_content', guide)

if __name__ == '__main__':
    unittest.main()
