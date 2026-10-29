"""Generate task name data from the installed Plugin-SDK enum, without guessing IDs."""
import json
import pathlib
import re
import sys

source = pathlib.Path(sys.argv[1])
destination = pathlib.Path(sys.argv[2])
text = source.read_text(encoding='utf-8-sig')
text = re.sub(r'/\*.*?\*/|//[^\n]*', '', text, flags=re.S)
body = re.search(r'enum\s+eTaskType\s*:\s*int\s*\{(.*?)\}', text, re.S).group(1)
names = {}
value = -1
for part in body.split(','):
    part = part.strip()
    if not part:
        continue
    if part == 'MAX_NUM_TASK_TYPES':
        continue
    match = re.fullmatch(r'(TASK_\w+)(?:\s*=\s*(0x[0-9a-fA-F]+|\d+))?', part)
    if not match:
        raise ValueError(f'Unsupported enum entry: {part}')
    value = int(match[2], 0) if match[2] else value + 1
    names[str(value)] = match[1]
destination.write_text(json.dumps({'source': str(source), 'names': names}, indent=2), encoding='utf-8')
print(f'Generated {len(names)} task names.')
