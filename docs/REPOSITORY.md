# Conteúdo do repositório e configuração local

A raiz versionável é a pasta que contém `McpServer.sln`. Manter código C++,
Lua/Python/PowerShell, testes reutilizáveis, documentação offline, dependências
distribuídas com suas licenças e `skills/gta-sa-memory`.

## Caminhos

- `PLUGIN_SDK_DIR`: raiz do Plugin-SDK usado pelo projeto Visual Studio.
- `GTA_SA_DIR`: instalação do GTA para os comandos de instalação e testes Lua.
- `tools/start_ingame_chat.ps1`: aceita `-GameRoot`, `-Python`, `-ProjectRoot`.
  Preferências privadas podem ficar em `.local/paths.psd1`, por exemplo:

  ```powershell
  @{
      GameRoot = 'C:\path\to\GTA San Andreas'
      Python = 'C:\path\to\python.exe'
  }
  ```

- A configuração MCP de cada cliente deve apontar para o EXE compilado da cópia
  local. Caminhos de exemplo no README devem ser substituídos, não copiados como
  se fossem uma configuração universal.
- `tools/install_v3.ps1` instala os arquivos compilados desta própria cópia no
  GTA. Não sincroniza mais outra árvore de fontes. Suporta `-WhatIf` e mantém
  backups em `.local/backups`. O painel experimental tem instalação própria
  descrita em `INGAME_CHAT.md`.

## Arquivos locais

O `.gitignore` exclui `.vs`, builds `bin/obj`, temporários, logs, bases IDA,
backups, dados de execução do jogo e `.local`.

Relatórios locais de testes com o jogo ficam em `.local/test-results`.
O JSON original CME, com metadados da máquina do export,
fica em `.local/reference-originals`. A referência distribuída é o JSON gzip
sanitizado em `docs/game-memory`, com seu manifesto.

O histórico do painel, `session.json`, `usage.json` e respostas ficam na
instalação do jogo em `mcp_scripts/chat`, não no código-fonte.

Não remover testes C++/Lua/Python apenas por terem sido criados durante o
protótipo: validam ABI, fila, offsets, execução, documentação, relay, formatação,
limites de uso e consultas ao export. Os relatórios de execução são artefatos;
os programas que os produzem são testes reutilizáveis.

## Verificação sem alterar o jogo

```powershell
python -m unittest discover -s .\tests -p '*Tests.py'
python .\tests\integration.py
& "$env:GTA_SA_DIR\moonloader\luajit\bin\luajit.exe" .\tests\RunnerTests.lua .\moonloader\lib\mcp_runner.lua
& "$env:GTA_SA_DIR\moonloader\luajit\bin\luajit.exe" .\tests\ChatMarkdownTests.lua .\moonloader\lib\mcp_chat_markdown.lua
& .\tools\install_v3.ps1 -WhatIf
```

`integration.py` requer o EXE compilado e testa um pipe próprio, separado do GTA.
`live_execution.py` é opt-in: opera no jogo aberto e salva seus relatórios no
caminho passado em `--output`; não deve ser incluído em uma execução automática
de testes sem o GTA pronto para executar os scripts.
