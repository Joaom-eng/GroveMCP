"""Bounded, offline queries of the CME IDA JSON export. Standard library only."""
import argparse
import gzip
import json
import os
from pathlib import Path


def locate_database(explicit=None):
    if explicit or os.environ.get('GTA_SA_MEMORY_DB'):
        return Path(explicit or os.environ['GTA_SA_MEMORY_DB']).expanduser().resolve()
    for base in (Path.cwd(), Path(__file__).resolve()):
        for parent in (base, *base.parents):
            for relative in ('docs/game-memory/gta_sa.cme.json.gz', 'docs/gta_sa.cme.json',
                             'McpServer/docs/game-memory/gta_sa.cme.json.gz'):
                candidate = parent / relative
                if candidate.is_file():
                    return candidate
    raise FileNotFoundError('Reference not found. Run from the project or pass --db / set GTA_SA_MEMORY_DB.')


def load_database(path):
    opener = gzip.open if path.suffix == '.gz' else open
    with opener(path, 'rt', encoding='utf-8-sig') as source:
        data = json.load(source)
    if data.get('schema') != {'name': 'cme.ida-ir', 'version': 1}:
        raise ValueError('Unsupported CME export schema')
    return data


def number(address):
    value = address.get('absolute', {}) if isinstance(address, dict) else {}
    return int(value['hex'], 16) if value.get('hex') else None


def summary(entry, kind):
    result = {k: entry[k] for k in ('name', 'demangled_name', 'address', 'end_address',
              'size_bytes', 'segment', 'type_source', 'ordinal', 'kind') if k in entry}
    if kind == 'types':
        result['declaration'] = entry.get('declaration')
        result['member_count'] = len(entry.get('members', []))
        result['value_count'] = len(entry.get('values', []))
    else:
        signature = entry.get('type') or {}
        result['declaration'] = signature.get('declaration')
        if signature.get('kind') == 'function':
            result['calling_convention_raw'] = signature.get('calling_convention')
            result['return_type'] = signature.get('return_type')
            result['arguments'] = signature.get('arguments')
    return result


def member_summary(member):
    result = {k: member[k] for k in ('name', 'offset_bytes', 'offset_bits', 'size_bytes',
              'size_bits', 'comment', 'properties', 'type') if k in member}
    if isinstance(member.get('offset_bytes'), int):
        result['offset_hex'] = hex(member['offset_bytes'])
    return result


def query(data, command, value=None, kind='all', limit=10, exact=False, field=None, offset=None):
    if not 1 <= limit <= 100:
        raise ValueError('limit must be between 1 and 100')
    if command == 'info':
        return {'database': data['database'], 'statistics': data['statistics'],
                'diagnostics': data.get('diagnostics')}
    if command == 'type':
        types = [t for t in data['types'] if t.get('name', '').casefold() == value.casefold()]
        if len(types) != 1:
            raise ValueError('Type not found or ambiguous; use search --kind types first')
        entry = types[0]
        members = entry.get('members', [])
        if field:
            members = [m for m in members if field.casefold() in m.get('name', '').casefold()]
        if offset is not None:
            members = [m for m in members if isinstance(m.get('offset_bits'), int)
                       and m['offset_bits'] <= offset * 8 < m['offset_bits'] + (m.get('size_bits') or 1)]
        result = summary(entry, 'types')
        result.update(members=[member_summary(m) for m in members[:limit]],
                      matched_members=len(members), truncated=len(members) > limit)
        if entry.get('kind') == 'enum':
            result.update(values=entry.get('values', [])[:limit],
                          truncated=len(entry.get('values', [])) > limit)
        return result
    matches = []
    kinds = ('functions', 'types', 'symbols') if kind == 'all' else (kind,)
    for category in kinds:
        for entry in data[category]:
            if command == 'address':
                start, end = number(entry.get('address')), number(entry.get('end_address'))
                found = start == value or (category == 'functions' and start is not None
                                          and end is not None and start <= value < end)
                rank = 0 if start == value else 1
            else:
                names = [str(entry.get(k) or '').casefold() for k in ('name', 'demangled_name')]
                needle = value.casefold()
                found = any(needle == n if exact else needle in n for n in names)
                rank = 0 if needle in names else 1
            if found:
                matches.append((rank, category, entry))
    matches.sort(key=lambda match: (match[0], match[1], match[2].get('name', '')))
    return {'matched': len(matches), 'truncated': len(matches) > limit,
            'results': [dict(category=c, **summary(e,c)) for _,c,e in matches[:limit]]}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--db', help='Export .json or .json.gz; otherwise discover from project cwd')
    sub = parser.add_subparsers(dest='command', required=True)
    sub.add_parser('info')
    search = sub.add_parser('search')
    search.add_argument('value')
    search.add_argument('--kind', choices=('all','functions','types','symbols'), default='all')
    search.add_argument('--exact', action='store_true')
    search.add_argument('--limit', type=int, default=10)
    types = sub.add_parser('type')
    types.add_argument('value')
    types.add_argument('--field')
    types.add_argument('--offset', type=lambda s: int(s,0))
    types.add_argument('--limit', type=int, default=30)
    address = sub.add_parser('address')
    address.add_argument('value', type=lambda s: int(s,0))
    address.add_argument('--kind', choices=('all','functions','symbols'), default='all')
    address.add_argument('--limit', type=int, default=10)
    args = parser.parse_args()
    try:
        path = locate_database(args.db)
        data = load_database(path)
        options = vars(args).copy()
        del options['db']
        result = query(data, **options)
        output = {'reference': path.name, 'generated_at_utc': data['generated_at_utc'],
                  'image_base': data['database']['image_base'],
                  'input_hashes': data['database']['input_hashes'], 'result': result}
        print(json.dumps(output, ensure_ascii=False, indent=2))
    except (OSError, ValueError, KeyError) as error:
        parser.error(str(error))


if __name__ == '__main__':
    main()
