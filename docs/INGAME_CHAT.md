# Chat experimental dentro do GTA

`mcp_ingame_chat.lua` fornece um painel MoonImGui aberto por **F7**. Digite uma
mensagem e pressione Enter ou Enviar. F7 também fecha o painel; a consulta pode
continuar enquanto você joga. **Cancelar** encerra a consulta ao Codex CLI;
não desfaz ações realizadas nem garante a parada de um script já iniciado no
GTA. Para cancelar um módulo Lua gerenciado, use `gta_stop_script` e confirme seu
estado com `gta_get_command`.

O painel usa uma **sessão própria do Codex CLI**, com histórico persistido. Não
envia mensagens à conversa aberta no aplicativo desktop. O Codex usa seu login
existente e o MCP `gta_sa` já configurado para consultar e modificar o jogo
conforme seus pedidos. Essas consultas consomem o uso normal da conta; o texto
segue ao serviço Codex pela CLI. Não é necessário colocar uma chave no Lua.

Abaixo do modelo aparecem duas barras: **5h** e **Semanal**, mostrando a
porcentagem **usada da conta inteira**, compartilhada com outros chats. Passe o
mouse para ver o horário da consulta e da renovação. O relay consulta
`account/rateLimits/read` a cada 60 segundos em uma thread separada, sem inferência
do modelo e sem bloquear mensagens. Os valores chegam ao Lua por `usage.json`.
As janelas são identificadas pela duração (300 e 10080 minutos), pois a API pode
retorná-las em posições diferentes. Uma janela ausente aparece como indisponível;
valores antigos recebem `*` se a atualização falhar ou tiver mais de três minutos.

## Instalação e início

Requer MoonLoader, a biblioteca **imgui/MoonImGui** instalada (esta implementação
não usa mimgui), Python 3 e Codex CLI autenticado, com o MCP do GTA configurado.
Os scripts `mcp_bridge.lua` e a versão 3 do ASI devem estar instalados.

1. Copie `moonloader/lib/mcp_chat_markdown.lua` para `moonloader/lib` e
   `moonloader/examples/mcp_ingame_chat.lua` para a pasta `moonloader` do
   GTA, onde será carregado automaticamente ao iniciar o jogo. Se o GTA já
   estiver aberto, carregue esse arquivo uma única vez com `gta_load_script`.
2. Inicie o relay no PowerShell:

   ```powershell
   & '.\tools\start_ingame_chat.ps1' -GameRoot $env:GTA_SA_DIR
   ```

   O iniciador tem parâmetros `-GameRoot`, `-Python` e `-ProjectRoot` para outras instalações.
   A pasta do jogo vem de `GTA_SA_DIR` ou `-GameRoot`. O diretório de trabalho é a
   raiz do projeto que contém o iniciador; Python é localizado pelo launcher `py`
   ou pelo PATH e pode ser informado com `-Python`. O executável Codex também é
   localizado pelo PATH.
   Preferências desta máquina podem ficar em `.local/paths.psd1` (ignorado pelo
   Git), com as chaves `GameRoot` e `Python`. Não há caminho pessoal no código.
   Se a CLI falhar ao preparar permissões de uma pasta, usar uma cópia de trabalho
   permitida com `-ProjectRoot`, preservando o isolamento.
3. Com o jogo carregado e o CJ disponível para controle, pressione F7.
   O indicador deve mostrar o relay conectado. Isso confirma o serviço do chat;
   a conexão com o ASI e o MoonLoader é verificada por `gta_get_status`.
   Experimente: “Qual é a vida atual do CJ? Consulte pelo MCP.”

Não carregue duas cópias do painel simultaneamente. O relay inicia oculto e
permanece ativo ao fechar o painel ou o GTA. Ele não foi registrado para iniciar
com o Windows: execute o iniciador novamente após reiniciar o computador.

Para parar, primeiro cancele eventual consulta no painel. Depois crie o marcador:

```powershell
New-Item -ItemType File -Force -Path (Join-Path $env:GTA_SA_DIR 'mcp_scripts\chat\relay.stop')
```

Esse marcador é verificado entre consultas. O próximo início remove o marcador.
O iniciador evita processos duplicados; o relay também possui um lock exclusivo.

## Caminho de uma mensagem

```text
MoonImGui -> requests/*.json -> relay Python -> Codex CLI (sessão própria)
                                                  |
                                         MCP EXE -> ASI -> MoonLoader
                                                  |
MoonImGui <- responses/*.json <- resposta do Codex --+
```

A caixa postal usa arquivos locais, sem servidor HTTP. O Lua grava pedidos no
loop principal, fora do callback de desenho. O Python executa a CLI em processo
separado, publica progresso e grava a resposta. O painel verifica os arquivos a
cada 250 ms. As operações no jogo continuam passando pelas ferramentas do MCP
existente; o ASI não precisa transportar as mensagens do chat.

O modelo é descoberto pelo `model/list` do app-server local da CLI. O relay usa
o modelo padrão desse catálogo e mostra seu nome no painel; não altera as
configurações globais. O modelo disponível pode variar conforme a conta e a
versão da CLI. Para escolher explicitamente outro modelo do catálogo, execute
o relay Python com `--model`.

## Estado e limites

Os arquivos ficam em `GTA/mcp_scripts/chat`: `session.json` identifica a sessão;
`ui_state.json` preserva o histórico visível; `status.json` contém o heartbeat;
`responses` guarda respostas e `relay-*.log` auxilia o diagnóstico. São dados
locais da conversa e não devem ser incluídos no repositório.

- Um pedido pendente por painel; entrada limitada a 4095 bytes UTF-8.
- Histórico visível limitado às últimas 24 mensagens; sem streaming de tokens.
- Respostas do Codex possuem Markdown básico: `**destaque**`/`__destaque__`
  aparecem realçados, crases destacam código, cercas de três crases ou tis
  preservam blocos de código e títulos/listas ganham apresentação simples.
  A quebra automática respeita UTF-8. O histórico original permanece intacto,
  incluindo mensagens anteriores à atualização. Não é um renderizador Markdown
  completo: HTML, tabelas, links clicáveis e execução de código não fazem parte
  desse recurso. Mensagens digitadas pelo usuário continuam sendo texto literal.
- Tempo limite padrão de 300 segundos por consulta. Cancelar não desfaz alterações.
- Pedidos com mais de dez minutos ou interrompidos por falha do relay não são
  executados novamente automaticamente. Um timeout pode deixar ações já feitas.
- Fechar F7 devolve os controles ao jogo. O script tenta liberar o cursor ao
  terminar normalmente; isso não garante recuperação de um crash do jogo.
- Jogo sem foco pode suspender scripts. `work-in-pause` não garante execução
  quando minimizado. A UI deve ser testada na configuração de tela do usuário.

## Verificação

```powershell
python .\tests\ChatRelayTests.py
python .\tests\UsageLimitsTests.py
& "$env:GTA_SA_DIR\moonloader\luajit\bin\luajit.exe" .\tests\ChatMarkdownTests.lua .\moonloader\lib\mcp_chat_markdown.lua
```

Os cinco testes locais usam um processo falso para validar protocolo, UTF-8,
retomada da sessão, duplicatas, rejeição de entradas, cancelamento anterior ao
envio e lock exclusivo. Eles não substituem o teste do painel dentro do jogo.
O teste Lua adicional verifica delimitadores, marcação incompleta, literais de
código, títulos/listas, quebras com acentos, porcentagens e o contrato de desenho.
Os cinco testes de limites verificam seleção do bucket da conta, duração das
janelas, valores ausentes versus zero, formatos inválidos e limites de 0–100%.

Para conferir a integração completa, envie pelo painel: “Qual é a vida atual do
CJ? Consulte pelo MCP.” A resposta deve corresponder à leitura feita no jogo.
O valor depende da condição atual do personagem. Relatórios locais de teste
ficam em `.local/test-results`, ignorados pelo Git.

Referências da CLI: [exec não interativo](https://developers.openai.com/codex/noninteractive)
e [app-server/model list](https://developers.openai.com/codex/app-server).
