"""Offline address containment and struct-layout queries, with a tiny fixture."""
import importlib.util
from pathlib import Path
import unittest

path = Path(__file__).resolve().parents[1] / 'skills/gta-sa-memory/scripts/lookup.py'
spec = importlib.util.spec_from_file_location('memory_lookup', path)
lookup = importlib.util.module_from_spec(spec)
spec.loader.exec_module(lookup)

def addr(value):
    return {'absolute': {'hex': hex(value)}}

DATA = {'functions': [{'name': 'Ped::Run', 'address': addr(0x401000),
                      'end_address': addr(0x401020), 'type': {'declaration': 'void __thiscall(Ped *)'}}],
        'symbols': [{'name': 'PedPool', 'address': addr(0x500000)}],
        'types': [{'name': 'Ped', 'kind': 'struct', 'size_bytes': 8,
                   'members': [{'name': 'health', 'offset_bits': 32, 'offset_bytes': 4,
                                'size_bits': 32, 'size_bytes': 4, 'type': {'declaration': 'float'}}]}]}

class LookupTests(unittest.TestCase):
    def test_function_containment_and_exclusive_end(self):
        self.assertEqual(lookup.query(DATA, 'address', 0x401010)['matched'], 1)
        self.assertEqual(lookup.query(DATA, 'address', 0x401020)['matched'], 0)

    def test_symbol_requires_exact_address(self):
        self.assertEqual(lookup.query(DATA, 'address', 0x500000)['matched'], 1)
        self.assertEqual(lookup.query(DATA, 'address', 0x500001)['matched'], 0)

    def test_field_by_name_and_containing_byte(self):
        field = lookup.query(DATA, 'type', 'Ped', field='HEALTH')['members'][0]
        self.assertEqual(field['offset_hex'], '0x4')
        self.assertEqual(field['type']['declaration'], 'float')
        self.assertEqual(lookup.query(DATA, 'type', 'Ped', offset=7)['matched_members'], 1)
        self.assertEqual(lookup.query(DATA, 'type', 'Ped', offset=8)['matched_members'], 0)

    def test_exact_search_and_result_limit(self):
        self.assertEqual(lookup.query(DATA, 'search', 'Ped', kind='types', exact=True)['matched'], 1)
        self.assertEqual(lookup.query(DATA, 'search', 'Ped', kind='functions', exact=True)['matched'], 0)
        result = lookup.query(DATA, 'search', 'Ped', limit=1)
        self.assertEqual(len(result['results']), 1)
        self.assertTrue(result['truncated'])
        with self.assertRaises(ValueError): lookup.query(DATA, 'search', 'Ped', limit=101)

if __name__ == '__main__':
    unittest.main()
