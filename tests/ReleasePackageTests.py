import importlib.util
from pathlib import Path
import tempfile
import unittest
import zipfile

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('package_release', ROOT/'tools/package_release.py')
package = importlib.util.module_from_spec(spec)
spec.loader.exec_module(package)

class ReleasePackageTests(unittest.TestCase):
    def test_game_layout_and_reproducible_zip_entries(self):
        temporary = ROOT/'tests/.tmp'
        temporary.mkdir(exist_ok=True)
        with tempfile.TemporaryDirectory(dir=temporary) as folder:
            a, b = Path(folder)/'a.zip', Path(folder)/'b.zip'
            files = {'McpServer.SA.asi':b'fake-test-binary', 'moonloader/test.lua':'-- ação de teste'.encode('utf-8')}
            first = package.make_archive(a,files)
            second = package.make_archive(b,files)
            self.assertEqual(first['sha256'],second['sha256'])
            with zipfile.ZipFile(a) as archive:
                self.assertEqual(set(archive.namelist()),set(files))
                self.assertEqual(archive.read('moonloader/test.lua'),files['moonloader/test.lua'])
                self.assertTrue(all(i.date_time == (1980,1,1,0,0,0) for i in archive.infolist()))

    def test_local_state_and_path_escape_are_rejected(self):
        for path in ('.local/session.json','tests/result.json','../escape','C:/private.txt','a\\b',
                     'McpServer.exe','README.md','manifest.json'):
            with self.subTest(path=path), self.assertRaises(ValueError):
                package.make_archive(Path('unused.zip'),{path:b'private'})

    def test_non_pe_input_is_rejected(self):
        with self.assertRaises(ValueError):
            package.pe_info(ROOT/'LICENSE')

if __name__ == '__main__':
    unittest.main()
