# Referência offline do MoonLoader

Comece por [EVENTS.md](EVENTS.md) e [DEBUGGING.md](DEBUGGING.md). Este pacote é
uma cópia local para pesquisa; não precisa de internet para consultar ou indexar.

## O que está arquivado

- [Guia de desenvolvimento](forum-guide.md): primeiro post da página GTAForums
  salva pelo usuário. Preserva explicações, exemplos e links; omite anúncios,
  scripts de página, navegação e respostas de outros usuários.
- [Links extraídos](forum-links.json) e [origem da importação](forum-source.json).
- [Referência do autor](raw/moonloader_reference.lua): assinaturas de funções,
  opcodes e eventos. É documentação dentro de comentários, não um script de teste.
- [Metadados da referência](raw/moonloader_reference.source.json): URL, revisão,
  atualização remota, data de captura e SHA256.
- [Wiki exportada](wiki/): páginas em Markdown, com exemplos preservados.
  Os originais estão em russo; os dois guias deste projeto estão em português.
- [Manifesto da wiki](wiki-manifest.json): cada URL, data e hashes da página
  recebida e do Markdown. Páginas indisponíveis são registradas explicitamente.
- [API gerada](API.md), [eventos em JSON](events.json) e [índice](index.json).

O fórum apontava para `blast.hk/wiki/...`; os redirecionamentos oficiais levaram
à wiki atual `wiki.blast.hk`. O índice de eventos da wiki não lista os três D3D;
eles constam na referência do autor e suas páginas individuais foram arquivadas.
Não tratar uma lista isolada como prova de que todos os eventos possíveis estão
presentes. Tampouco esta é uma exportação recursiva de toda a wiki: arquivamos o
guia, índices principais, eventos, diretivas e classes relevantes.

## Buscar sem conexão

Na raiz do projeto, usando Python 3:

```powershell
python .\tools\moonloader_docs.py search onD3DPresent
python .\tools\moonloader_docs.py search onScriptTerminate --kind event --json
python .\tools\moonloader_docs.py search getCharCoordinates --kind function
python .\tools\moonloader_docs.py search 0860 --kind function
python .\tools\moonloader_docs.py search 'wait' --kind guide
```

Também é possível usar `rg` diretamente nos arquivos. A busca retorna assinatura,
arquivo/linha, origem e estado de verificação, com trechos limitados para não
carregar páginas inteiras no contexto da IA. `--json` facilita integração futura
com uma ferramenta de consulta do MCP.

## Atualizar de forma explícita

Regerar índice a partir das cópias existentes, **sem rede**:

```powershell
python .\tools\moonloader_docs.py build
```

Importar outra cópia salva do tópico também não acessa a rede:

```powershell
python .\tools\moonloader_docs.py build --saved-forum 'C:\caminho\pagina.html'
```

Atualizar o conjunto limitado de páginas da wiki **com rede**:

```powershell
python .\tools\moonloader_docs.py build --fetch-wiki
```

Não há instalação de pacotes Python, execução de JavaScript do HTML, serviço
externo de embeddings ou atualização automática. A referência do Gist foi
capturada separadamente, com seus metadados, e não muda no build offline.

## Versão, dependências e evidência

O jogo usado neste projeto é GTA SA 1.0 US, MoonLoader 0.27.0-preview3, LuaJIT
32 bits, CLEO 4.4.4 e MoonImGui 1.1.5. As referências são de épocas diferentes e
não constituem uma especificação completa dessa instalação. Alguns nomes do
Gist e do índice atual diferem; consultar ambos e testar quando houver dúvida.

Cada assinatura indexada significa **documentado**, não **verificado no jogo**.
Funções SA-MP/RakNet/SAMPFUNCS podem exigir componentes que não usamos no
single-player. A inexistência de uma função global chamada `onD3DPresent` antes
de definirmos um handler não prova que o evento não existe.

Resultados realmente executados ficam em `../../tests/runtime_live_result.json`,
`../../tests/gang_ped_watch_live.json` e nos demais testes do projeto. Referências
de offsets/ABI vêm do Plugin-SDK e da análise da versão específica do binário,
não desta lista de eventos. Bibliotecas instaladas continuam sendo a autoridade
para seus callbacks próprios, como `imgui.OnDrawFrame`.

Originais e exemplos mantêm a autoria de BH Team/THE-FYP/BlastHack e respectivos
autores. A cópia local não atribui uma nova licença aos textos de terceiros.
Antes de redistribuir um pacote público, conferir as licenças das fontes.
