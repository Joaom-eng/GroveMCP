# GroveMCP @VERSION@ — Windows x86

Servidor MCP para criar, executar e depurar scripts/mods no GTA San Andreas.
Este pacote contém os binários prontos; não é necessário compilar.

## Requisitos

- GTA San Andreas PC 1.0 US, no Windows, com ASI Loader e MoonLoader instalados.
- Ambiente de referência: MoonLoader 0.27.0-preview3, com LuaJIT de 32 bits.
- Um cliente MCP, como Codex ou Claude Code. Consulte `docs/CLIENTS.md` para o
  estado da compatibilidade; o teste real no Claude Code ainda está pendente.

GTA, ASI Loader, MoonLoader, Python e clientes de IA não são redistribuídos aqui.
O servidor usa runtime C++ estático. O pacote do chat F7 é opcional e separado.

## Instalar

1. Extraia este pacote para uma pasta fixa de sua escolha. Mantenha a estrutura
   de pastas. Não copie o pacote inteiro para a pasta do GTA.
2. Com o GTA fechado, copie `bin/GTA-SA/Release/McpServer.SA.asi` para a raiz
   do jogo ou uma pasta do Modloader, conforme a instalação do seu ASI Loader.
   Instale apenas uma cópia do ASI.
3. Copie `moonloader/mcp_bridge.lua` para a pasta `moonloader` do GTA e
   `moonloader/lib/mcp_runner.lua` para `moonloader/lib` do GTA.
4. Deixe `bin/Host/Release/McpServer.exe`, `docs`, `tools`, `skills` e os exemplos
   na pasta onde extraiu a release. Não renomeie o ASI: os scripts o localizam
   pelo nome `McpServer.SA.asi`.

Para atualizar, feche o GTA e substitua o ASI e os dois arquivos Lua juntos.

## Conectar a IA

Na pasta da release, em PowerShell:

```powershell
$mcpExe = (Resolve-Path '.\bin\Host\Release\McpServer.exe').Path
```

Execute somente o comando do cliente escolhido:

```powershell
# Codex
codex mcp add gta_sa -- "$mcpExe" --stdio

# Claude Code
claude mcp add --transport stdio gta_sa -- "$mcpExe" --stdio
```

O cliente inicia o EXE automaticamente. `--stdio` não é um console interativo;
não aparecer uma mensagem ao executá-lo manualmente é normal.

Com o GTA em execução, uma verificação manual é:

```powershell
& '.\bin\Host\Release\McpServer.exe' --probe
```

Consulte `docs/CLIENTS.md` para interpretar `connected`,
`moonloader_worker_ready` e `simulated` e para as observações sobre pausa e foco.
Peça à IA para ler a vida do CJ usando `moonloader/examples/mcp_read_cj_health.lua`
para verificar a execução Lua e o retorno dos dados.

## Documentação e recursos opcionais

- `docs/CLIENTS.md`: ferramentas e configuração dos clientes.
- `docs/moonloader/README.md`: referência offline de funções e eventos.
- `docs/game-memory/README.md`: funções, classes e offsets do export IDA.
- `skills/gta-sa-memory`: skill opcional; o helper também funciona diretamente.
- `moonloader/examples`: exemplos para carregar explicitamente pela IA.
- `tools/mcp_client.py`: cliente diagnóstico sem IA (requer Python 3).
- Chat F7: extraia o complemento Codex Chat sobre esta mesma pasta e leia
  `CODEX_CHAT.md`. O chat não é necessário para usar o MCP em um cliente externo.

Os scripts Lua têm acesso ao processo do jogo. Cancelar ou atingir o tempo limite
não desfaz alterações já realizadas. Não reenviar automaticamente uma ação
quando uma falha de comunicação deixar incerto se ela já começou.

## Licenças e integridade

O código do GroveMCP usa a licença MIT em `LICENSE`. Dependências e referências
de terceiros mantêm seus próprios créditos e termos; veja `THIRD_PARTY_NOTICES.md`
e `licenses`. O manifesto `manifest.json` registra versão e SHA256 dos arquivos.
