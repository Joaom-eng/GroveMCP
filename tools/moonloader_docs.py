"""Build/search an offline MoonLoader reference. Standard library only.

build imports a user-saved GTAForums page and the pinned local API reference.
--fetch-wiki optionally downloads a bounded set of official wiki pages; search
and ordinary builds do not access the network. HTML is parsed, never executed.
"""
import argparse
import concurrent.futures
import hashlib
import html
from html.parser import HTMLParser
import json
from pathlib import Path
import re
import sys
import time
from urllib.parse import urljoin, urlsplit
from urllib.request import Request, urlopen

PROJECT = Path(__file__).resolve().parents[1]
ROOT = PROJECT / 'docs' / 'moonloader'
WIKI = 'https://wiki.blast.hk'
FORUM_URL = 'https://gtaforums.com/topic/890990-moonloader-%E2%80%94-development/'
GIST_URL = 'https://gist.github.com/THE-FYP/abc6f8bea87f4cb42331fc6dd7a84576'

class Node:
    def __init__(self, tag='', attrs=()):
        self.tag, self.attrs, self.children = tag, dict(attrs), []
    def walk(self):
        yield self
        for child in self.children:
            if isinstance(child, Node):
                yield from child.walk()
    def text(self):
        return ''.join(c.text() if isinstance(c, Node) else c for c in self.children)

class DOM(HTMLParser):
    VOID = set('area base br col embed hr img input link meta param source track wbr'.split())
    def __init__(self, text):
        super().__init__(convert_charrefs=True)
        self.root = Node('root')
        self.stack = [self.root]
        self.feed(text)
    def handle_starttag(self, tag, attrs):
        node = Node(tag, attrs)
        self.stack[-1].children.append(node)
        if tag not in self.VOID:
            self.stack.append(node)
    def handle_startendtag(self, tag, attrs):
        self.handle_starttag(tag, attrs)
        if tag not in self.VOID:
            self.handle_endtag(tag)
    def handle_endtag(self, tag):
        for index in range(len(self.stack) - 1, 0, -1):
            if self.stack[index].tag == tag:
                del self.stack[index:]
                return
    def handle_data(self, data):
        self.stack[-1].children.append(data)

def render(node, base):
    if not isinstance(node, Node):
        return re.sub(r'\s+', ' ', node.replace('\xa0', ' '))
    if node.tag in ('script', 'style', 'iframe', 'svg', 'noscript') or node.attrs.get('data-excludequote') is not None:
        return ''
    if node.tag == 'pre':
        code = node.text().strip('\r\n')
        fence = '```'
        while fence in code:
            fence += '`'
        return '\n\n' + fence + 'lua\n' + code + '\n' + fence + '\n\n'
    text = ''.join(render(c, base) for c in node.children)
    if node.tag == 'a':
        href = node.attrs.get('href', '')
        if href.startswith('#') or not text.strip():
            return '' if text.strip() == '¶' else text
        url = urljoin(base, href)
        if urlsplit(url).scheme in ('http', 'https'):
            return '[' + text.strip() + '](' + url + ')'
    if node.tag == 'code':
        return '`' + node.text() + '`'
    if node.tag == 'br':
        return '\n'
    if node.tag in ('h1', 'h2', 'h3', 'h4'):
        return '\n\n' + '#' * int(node.tag[1]) + ' ' + text.strip() + '\n\n'
    if node.tag == 'li':
        return '\n- ' + text.strip() + '\n'
    if node.tag in ('p', 'div', 'ul', 'ol', 'section', 'table', 'tr'):
        return '\n\n' + text.strip() + '\n\n'
    if node.tag in ('td', 'th'):
        return text.strip() + ' | '
    return text

def cleaned(node, base):
    return re.sub(r'\n[ \t]*\n(?:[ \t]*\n)+', '\n\n', render(node, base)).strip() + '\n'

def write_json(path, data):
    path.write_text(json.dumps(data, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')

def sha(data):
    return hashlib.sha256(data).hexdigest()

def forum_import(path):
    original = path.read_bytes()
    dom = DOM(original.decode('utf-8-sig'))
    post = next((n for n in dom.root.walk() if n.attrs.get('data-role') == 'commentContent'), None)
    if post is None or 'Development Guide' not in post.text():
        raise ValueError('Saved page does not contain the MoonLoader development guide')
    links = []
    for node in post.walk():
        if node.tag == 'a' and node.attrs.get('href', '').startswith(('http:', 'https:')):
            links.append({'label': node.text().strip(), 'url': node.attrs['href']})
    text = '# MoonLoader Development Guide — cópia do primeiro post\n\n'
    text += f'Fonte: {FORUM_URL}\n\nImportado do HTML salvo pelo usuário; scripts e anúncios não são executados nem incluídos.\n\n'
    text += cleaned(post, FORUM_URL)
    (ROOT / 'forum-guide.md').write_text(text, encoding='utf-8')
    write_json(ROOT / 'forum-links.json', links)
    return {'url': FORUM_URL, 'imported_from': str(path), 'saved_html_sha256': sha(original),
            'local_file': 'forum-guide.md', 'scope': 'first post only; linked pages require separate snapshots'}

def fetch_wiki_page(url):
    if urlsplit(url).netloc != 'wiki.blast.hk' or not urlsplit(url).path.startswith('/moonloader/'):
        raise ValueError('Only official MoonLoader wiki pages are allowed')
    request = Request(url, headers={'User-Agent': 'McpServer-OfflineDocs/0.3 (documentation archive)'})
    with urlopen(request, timeout=15) as response:
        final = response.url
        if urlsplit(final).netloc != 'wiki.blast.hk':
            raise ValueError('Unexpected redirect outside official wiki')
        content = response.read(2 * 1024 * 1024 + 1)
    if len(content) > 2 * 1024 * 1024:
        raise ValueError('Documentation page exceeds 2 MiB')
    dom = DOM(content.decode('utf-8-sig'))
    body = next((n for n in dom.root.walk() if n.tag == 'template' and n.attrs.get('slot') == 'contents'), None)
    if body is None or len(body.text().strip()) < 10:
        raise ValueError('No wiki content template; possibly an error or security page')
    title = next((n.text() for n in dom.root.walk() if n.tag == 'title'), url)
    filename = urlsplit(url).path.strip('/').replace('/', '__') + '.md'
    output = ROOT / 'wiki' / filename
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(f'# {title}\n\nFonte: {final}\n\n' + cleaned(body, final), encoding='utf-8')
    links = [urljoin(final, n.attrs.get('href', '')) for n in body.walk() if n.tag == 'a']
    return {'url': final, 'html_sha256': sha(content), 'local_file': 'wiki/' + filename,
            'markdown_sha256': sha(output.read_bytes()), 'retrieved_utc': time.strftime('%Y-%m-%dT%H:%M:%SZ', time.gmtime())}, links

def fetch_wiki():
    sources, errors = [], []
    record, links = fetch_wiki_page(WIKI + '/moonloader/events')
    sources.append(record)
    # Follow only direct event entries, not an unbounded recursive crawl.
    urls = {u.split('#')[0] for u in links if u.startswith(WIKI + '/moonloader/lua/')}
    # Resolve the old forum wiki names to the destinations currently used by
    # the official redirects. The event index omits the three D3D callbacks;
    # include the author's reference so those are archived as well.
    urls.update(WIKI + '/moonloader/' + page for page in
        ('globals', 'scripting-api', 'opcodes', 'lua/script', 'scripting/threads'))
    urls.update(WIKI + '/moonloader/lua/' + name for name in
        ('addEventHandler', 'script_properties', 'script_name', 'script_author',
         'script_authors', 'script_description', 'script_version', 'script_version_number',
         'script_url', 'script_dependencies', 'script_moonloader'))
    reference = (ROOT / 'raw' / 'moonloader_reference.lua').read_text(encoding='utf-8')
    event_section = reference.split('--[[ Events', 1)[1]
    urls.update(WIKI + '/moonloader/lua/' + name for name in
        re.findall(r'\b(on\w+)\(', event_section))
    if len(urls) > 50:
        raise ValueError('Unexpected wiki link count; review before downloading')
    with concurrent.futures.ThreadPoolExecutor(max_workers=4) as pool:
        future_urls = {pool.submit(fetch_wiki_page, url): url for url in sorted(urls)}
        for future in concurrent.futures.as_completed(future_urls):
            url = future_urls[future]
            try:
                source, _ = future.result()
                sources.append(source)
            except Exception as error:
                errors.append({'url': url, 'error': str(error)})
    write_json(ROOT / 'wiki-manifest.json', {'sources': sorted(sources, key=lambda x: x['url']), 'unavailable': errors})
    return len(sources), errors

def build_index():
    entries, section = [], ''
    reference = ROOT / 'raw' / 'moonloader_reference.lua'
    pattern = re.compile(r'(?<![\w.])([A-Za-z_]\w*(?:[.:][A-Za-z_]\w*)*)\s*\(')
    for number, line in enumerate(reference.read_text(encoding='utf-8-sig').splitlines(), 1):
        if line.startswith('--[['):
            section = line[4:].strip()
            continue
        if not line.strip() or line.strip() == ']]':
            continue
        signature = line.split('  --', 1)[0].strip()
        match = pattern.search(signature)
        if match:
            name = match.group(1)
            opcode = re.search(r'--\s*([0-9A-Fa-f]{4})\b', line)
            entries.append({'name': name, 'kind': 'event' if section == 'Events' else 'function',
                'section': section, 'signature': signature, 'original_note': line[len(signature):].strip(),
                'opcode': opcode.group(1).upper() if opcode else None,
                'file': 'raw/moonloader_reference.lua', 'line': number, 'source_url': GIST_URL,
                'verification': 'documented; availability depends on runtime and dependencies'})
    for path in sorted((ROOT / 'wiki').glob('*.md')):
        text = path.read_text(encoding='utf-8')
        name = path.stem.split('__')[-1]
        entries.append({'name': name, 'kind': 'wiki_page', 'signature': text.splitlines()[0].lstrip('# '),
            'file': path.relative_to(ROOT).as_posix(), 'line': 1,
            'source_url': next((line[7:] for line in text.splitlines() if line.startswith('Fonte: ')), ''),
            'text': text, 'verification': 'archived official wiki; not automatically runtime-tested'})
        if path.name == 'moonloader__scripting-api.md':
            # Index the current wiki's signatures too; the older author gist is
            # useful but does not contain every symbol on the newer API page.
            event_names = {e['name'] for e in entries if e['kind'] == 'event'}
            for number, line in enumerate(text.splitlines(), 1):
                plain = re.sub(r'\[([^]]+)\]\([^)]+\)', r'\1', line).strip().rstrip('|').strip()
                match = pattern.search(plain)
                if match and match.group(1) not in event_names:
                    entries.append({'name': match.group(1), 'kind': 'function', 'signature': plain,
                        'file': path.relative_to(ROOT).as_posix(), 'line': number,
                        'source_url': WIKI + '/moonloader/scripting-api',
                        'verification': 'documented in current wiki; not runtime-probed'})
    for filename in ('forum-guide.md', 'EVENTS.md', 'DEBUGGING.md', 'README.md'):
        path = ROOT / filename
        if path.exists():
            text = path.read_text(encoding='utf-8')
            # Paragraph entries give useful snippets rather than returning whole guides.
            line_number = 1
            for paragraph in text.split('\n\n'):
                if paragraph.strip():
                    entries.append({'name': filename, 'kind': 'guide', 'signature': paragraph[:180],
                        'text': paragraph, 'file': filename, 'line': line_number,
                        'verification': 'project guidance' if filename != 'forum-guide.md' else 'saved author guide'})
                line_number += paragraph.count('\n') + 2
    write_json(ROOT / 'index.json', {'schema': 1, 'entries': entries})
    events = [entry for entry in entries if entry['kind'] == 'event']
    write_json(ROOT / 'events.json', events)
    (ROOT / 'API.md').write_text('# Assinaturas da referência do autor\n\n'
        'Gerado de `raw/moonloader_reference.lua`. Não executar a referência como script.\n'
        'Nomes documentados não garantem disponibilidade na instalação atual.\n\n'
        + '\n'.join('## ' + category + '\n\n' + '\n'.join(
            f"- `{e['signature']}` — linha {e['line']}" for e in entries if e.get('section') == category)
            for category in dict.fromkeys(e.get('section') for e in entries if e.get('section')))
        + '\n', encoding='utf-8')
    return entries

def search(query, kind, limit, as_json):
    entries = json.loads((ROOT / 'index.json').read_text(encoding='utf-8'))['entries']
    words = query.casefold().split()
    matches = []
    for entry in entries:
        if kind and entry['kind'] != kind:
            continue
        haystack = ' '.join(str(entry.get(key, '')) for key in ('name', 'signature', 'text', 'original_note', 'opcode')).casefold()
        if all(word in haystack for word in words):
            score = 100 if entry['name'].casefold() == query.casefold() else 0
            score += sum(10 for word in words if word in entry['name'].casefold())
            matches.append((score, entry))
    matches.sort(key=lambda item: (-item[0], item[1]['name']))
    selected = []
    for _, entry in matches[:limit]:
        result = dict(entry, path=str(ROOT / entry['file']))
        text = result.pop('text', '')
        if text:
            position = text.casefold().find(words[0]) if words else 0
            start = max(0, position - 160)
            result['snippet'] = text[start:start + 1600]
            result['snippet_truncated'] = start > 0 or start + 1600 < len(text)
        selected.append(result)
    if as_json:
        print(json.dumps({'total': len(matches), 'results': selected}, ensure_ascii=True, indent=2))
    else:
        for entry in selected:
            print(f"[{entry['kind']}] {entry['name']} — {entry['signature']}")
            print(f"  {ROOT / entry['file']}:{entry['line']}")
            print(f"  {entry.get('source_url', '')} | {entry['verification']}")
            if entry.get('snippet'):
                print(entry['snippet'])
        print(f'{len(selected)} of {len(matches)} matches')

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    commands = parser.add_subparsers(dest='command', required=True)
    build = commands.add_parser('build')
    build.add_argument('--saved-forum', type=Path)
    build.add_argument('--fetch-wiki', action='store_true')
    find = commands.add_parser('search')
    find.add_argument('query')
    find.add_argument('--kind', choices=['event', 'function', 'wiki_page', 'guide'])
    find.add_argument('--limit', type=int, default=8)
    find.add_argument('--json', action='store_true')
    options = parser.parse_args()
    ROOT.mkdir(parents=True, exist_ok=True)
    if options.command == 'build':
        if options.saved_forum:
            source = forum_import(options.saved_forum)
            write_json(ROOT / 'forum-source.json', source)
            print('Imported saved forum guide and links')
        if options.fetch_wiki:
            count, errors = fetch_wiki()
            print(f'Archived {count} wiki pages; {len(errors)} unavailable (see wiki-manifest.json)')
        entries = build_index()
        print(f"Indexed {len(entries)} records; {sum(e['kind'] == 'event' for e in entries)} documented event signatures")
    else:
        if not 1 <= options.limit <= 100:
            parser.error('--limit must be 1..100')
        search(options.query, options.kind, options.limit, options.json)

if __name__ == '__main__':
    if hasattr(sys.stdout, 'reconfigure'):
        sys.stdout.reconfigure(encoding='utf-8')
    main()
