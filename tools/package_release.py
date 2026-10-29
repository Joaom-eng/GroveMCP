"""Package GroveMCP binaries and optional Codex chat from explicit file lists.

ZIPs contain only files installed into GTA. The EXE stays in the repository.
Does not build, install into GTA, publish, or include machine-local state.
"""
import argparse
import hashlib
import json
from pathlib import Path
import re
import struct
import subprocess
import zipfile

ROOT = Path(__file__).resolve().parents[1]
EXPORTS = {'McpBridge_GetApiVersion', 'McpBridge_PollCommand',
           'McpBridge_ReportResult', 'McpBridge_ReportExecution'}
GAME_FILES = {
    'bin/GTA-SA/Release/McpServer.SA.asi': 'McpServer.SA.asi',
    'moonloader/mcp_bridge.lua': 'moonloader/mcp_bridge.lua',
    'moonloader/lib/mcp_runner.lua': 'moonloader/lib/mcp_runner.lua',
}
CHAT_FILES = {
    'moonloader/examples/mcp_ingame_chat.lua': 'moonloader/mcp_ingame_chat.lua',
    'moonloader/lib/mcp_chat_markdown.lua': 'moonloader/lib/mcp_chat_markdown.lua',
}


def pe_info(path, dll=False):
    data = path.read_bytes()
    for spelling in (str(ROOT.resolve()), str(ROOT.resolve()).replace('\\','/')):
        for encoding in ('utf-8','utf-16le','cp1252'):
            needle = spelling.encode(encoding, errors='replace')
            if needle in data:
                raise ValueError(f'{path.name}: local build path embedded in the binary')
    if data[:2] != b'MZ':
        raise ValueError(f'{path.name}: not a PE binary')
    pe = struct.unpack_from('<I', data, 0x3C)[0]
    if data[pe:pe+4] != b'PE\0\0':
        raise ValueError(f'{path.name}: invalid PE signature')
    machine, count = struct.unpack_from('<HH', data, pe+4)
    optional_size, characteristics = struct.unpack_from('<HH', data, pe+20)
    optional = pe+24
    if machine != 0x14C or struct.unpack_from('<H', data, optional)[0] != 0x10B:
        raise ValueError(f'{path.name}: expected Windows x86 PE32')
    if bool(characteristics & 0x2000) != dll:
        raise ValueError(f'{path.name}: wrong EXE/DLL kind')
    sections = optional+optional_size
    def offset(rva):
        for index in range(count):
            record = sections+index*40
            virtual_size, address, raw_size, raw_offset = struct.unpack_from('<IIII', data, record+8)
            if address <= rva < address+max(virtual_size, raw_size):
                return raw_offset+rva-address
        raise ValueError(f'{path.name}: RVA outside sections')
    def string(rva):
        start = offset(rva)
        return data[start:data.index(b'\0', start)].decode('ascii')
    directories = optional+96
    debug_rva, debug_size = struct.unpack_from('<II', data, directories+6*8)
    debug_types = []
    if debug_rva and debug_size:
        for index in range(debug_size // 28):
            entry = offset(debug_rva) + index*28
            debug_types.append(struct.unpack_from('<I', data, entry+12)[0])
        # Linker COFF-group/repro metadata can remain without any symbols/PDB.
        if any(kind in (2, 4) for kind in debug_types):
            raise ValueError(f'{path.name}: release contains a CodeView/PDB or debug filename reference')
    exported, imports = [], []
    export_rva = struct.unpack_from('<I', data, directories)[0]
    if export_rva:
        table = offset(export_rva)
        names_count = struct.unpack_from('<I', data, table+24)[0]
        names = offset(struct.unpack_from('<I', data, table+32)[0])
        exported = [string(struct.unpack_from('<I', data, names+i*4)[0]) for i in range(names_count)]
    import_rva = struct.unpack_from('<I', data, directories+8)[0]
    if import_rva:
        table = offset(import_rva)
        while any(data[table:table+20]):
            imports.append(string(struct.unpack_from('<I', data, table+12)[0]))
            table += 20
    if dll and not EXPORTS.issubset(exported):
        raise ValueError(f'{path.name}: missing ASI exports')
    if any(name.lower().startswith(('vcruntime', 'msvcp')) for name in imports):
        raise ValueError(f'{path.name}: unexpected external C++ runtime; build with /MT')
    return {'architecture': 'x86', 'imports': imports, 'exports': exported, 'debug_types':debug_types}


def check_server(path, version):
    messages = [
        {'jsonrpc':'2.0', 'id':1, 'method':'initialize', 'params':{
            'protocolVersion':'2025-11-25', 'capabilities':{},
            'clientInfo':{'name':'release-check','version':version}}},
        {'jsonrpc':'2.0','method':'notifications/initialized'},
        {'jsonrpc':'2.0','id':2,'method':'tools/list'}]
    run = subprocess.run([str(path), '--stdio'], input=''.join(json.dumps(m)+'\n' for m in messages),
                         text=True, encoding='utf-8', capture_output=True, timeout=10)
    if run.returncode:
        raise ValueError('Packaged MCP executable failed its handshake')
    responses = [json.loads(line) for line in run.stdout.splitlines()]
    if len(responses) != 2 or any('error' in r for r in responses):
        raise ValueError('Unexpected MCP handshake/tool discovery output')
    handshake = responses[0]['result']
    if handshake['serverInfo']['version'] != version or handshake['protocolVersion'] != '2025-11-25':
        raise ValueError('Server version/protocol does not match the release')
    names = {t['name'] for t in responses[1]['result']['tools']}
    if names != {'gta_get_status','gta_load_script','gta_run_script','gta_get_command','gta_stop_script'}:
        raise ValueError('Unexpected tool catalog')
    return {'version':version, 'mcp_protocol':'2025-11-25', 'tools':sorted(names)}


def add(files, source, destination=None):
    path = ROOT / source
    if not path.is_file():
        raise FileNotFoundError(f'Missing release input: {source}')
    path.resolve().relative_to(ROOT.resolve())
    name = destination or source
    if name in files:
        raise ValueError(f'Duplicate archive entry: {name}')
    files[name] = path.read_bytes()


def make_archive(output, files):
    for name in files:
        if Path(name).is_absolute() or '\\' in name or ':' in name or '..' in Path(name).parts:
            raise ValueError(f'Unsafe archive path: {name}')
        if any(part in ('.local','__pycache__','tests','obj') for part in Path(name).parts):
            raise ValueError(f'Local/test data in release: {name}')
        if Path(name).suffix not in ('.asi','.lua'):
            raise ValueError(f'Only game components belong in the ZIP: {name}')
    with zipfile.ZipFile(output, 'w', compression=zipfile.ZIP_DEFLATED, compresslevel=9) as archive:
        for name,data in sorted(files.items()):
            info = zipfile.ZipInfo(name, date_time=(1980,1,1,0,0,0))
            info.compress_type = zipfile.ZIP_DEFLATED
            info.external_attr = 0o100644 << 16
            archive.writestr(info, data)
    with zipfile.ZipFile(output) as archive:
        if archive.testzip():
            raise ValueError('ZIP integrity check failed')
        if set(archive.namelist()) != set(files):
            raise ValueError('Unexpected files in ZIP')
        for name,data in files.items():
            if archive.read(name) != data:
                raise ValueError('Archived file differs from its input')
    return {'name':output.name, 'bytes':output.stat().st_size,
            'sha256':hashlib.sha256(output.read_bytes()).hexdigest(), 'file_count':len(files)}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--version', help='Default: version from the project README')
    parser.add_argument('--output', type=Path, default=ROOT/'dist')
    args = parser.parse_args()
    match = re.search(r'^# GroveMCP.*?([0-9]+\.[0-9]+\.[0-9]+)', (ROOT/'README.md').read_text(encoding='utf-8-sig'), re.M)
    version = args.version or (match.group(1) if match else None)
    if not version or not re.fullmatch(r'\d+\.\d+\.\d+(?:-[A-Za-z0-9.-]+)?', version):
        parser.error('A valid release version is required')
    if not match or match.group(1) != version:
        parser.error('Update the project README version to match the release')
    output = args.output.resolve()
    targets = [output/f'GroveMCP-{version}-windows-x86.zip', output/f'GroveMCP-{version}-codex-chat.zip']
    if any(p.exists() for p in targets):
        parser.error('Release archive already exists; choose a new output directory or version')
    exe = ROOT/'bin/Host/Release/McpServer.exe'
    asi = ROOT/'bin/GTA-SA/Release/McpServer.SA.asi'
    check_server(exe,version)
    pe_info(exe)
    pe_info(asi,True)
    core = {}
    for source,destination in GAME_FILES.items():
        add(core,source,destination)
    chat = {}
    for source,destination in CHAT_FILES.items():
        add(chat,source,destination)
    output.mkdir(parents=True, exist_ok=True)
    records = [make_archive(targets[0],core), make_archive(targets[1],chat)]
    (output/'SHA256SUMS.txt').write_text(''.join(r['sha256']+'  '+r['name']+'\n' for r in records),encoding='ascii')
    print(json.dumps({'version':version,'packages':records},indent=2))


if __name__ == '__main__':
    main()
