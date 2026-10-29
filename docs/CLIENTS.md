# Codex e Claude Code

O núcleo é um servidor MCP local por `stdio`, que troca mensagens pela entrada e
saída do processo. Para configurar qualquer um dos clientes, usa-se o mesmo
`McpServer.exe --stdio`. O ASI (plugin carregado pelo GTA), o script de comunicação
do MoonLoader e o executor de scripts Lua não dependem do modelo de IA escolhido.
O login necessário para conversar com a IA é responsabilidade de cada cliente.

## Ferramentas disponíveis

As ferramentas são os comandos que o servidor oferece à IA. Elas não são cinco
programas que você precisa instalar: todas fazem parte do GroveMCP.

| Ferramenta | O que faz |
|---|---|
| `gta_get_status` | Consulta a conexão com o ASI e a disponibilidade do script de comunicação do MoonLoader. |
| `gta_load_script` | Carrega um arquivo Lua convencional pelo MoonLoader, como um painel ou monitor que continua ativo no jogo. |
| `gta_run_script` | Inicia um módulo Lua gerenciado, que pode devolver dados em JSON ou informar um erro. Retorna um identificador para acompanhar a execução. |
| `gta_get_command` | Consulta esse identificador para obter o estado, os dados retornados ou o erro de um comando. |
| `gta_stop_script` | Solicita o cancelamento de uma execução gerenciada iniciada com `gta_run_script`. Não desfaz efeitos já produzidos no jogo. |

Carregar um script com `gta_load_script` não significa que ele terminou nem que
executou sem erros. Essa ferramenta não oferece o mesmo acompanhamento de
resultado e cancelamento de `gta_run_script`.

O painel F7 é um componente opcional: seu relay atual usa Codex CLI. Conectar o
MCP ao Claude Code não faz o painel conversar com o Claude nem mostrar seus
limites de uso. Essa integração ainda não está implementada.

## Ambiente de referência

O primeiro alvo de suporte é Windows nativo, GTA SA PC 1.0 US, ASI Loader e
MoonLoader 0.27.0-preview3. A conexão com o jogo usa named pipes do Windows.
Linux, macOS, WSL, Wine e outras versões do jogo não foram validados. Em
particular, caminhos Linux não podem ser enviados como se fossem caminhos
absolutos do Windows para `gta_load_script`/`gta_run_script`.

## Configurar

Use as instruções do cliente que você escolheu: Codex ou Claude Code.
Na raiz do repositório, usando o EXE compilado que já está incluído, em PowerShell:

```powershell
$mcpExe = (Resolve-Path '.\bin\Host\Release\McpServer.exe').Path
```

Codex:

```powershell
codex mcp add gta_sa -- "$mcpExe" --stdio
codex mcp get gta_sa
```

Claude Code:

```powershell
claude mcp add --transport stdio gta_sa -- "$mcpExe" --stdio
claude mcp get gta_sa
```

O separador `--` distingue opções do cliente de argumentos do servidor. Verifique
as ferramentas na sessão do cliente (`/mcp`) e siga a aprovação normal do projeto.
O cliente escolhido inicia o EXE, que se comunica com o ASI carregado no GTA.

As instruções do projeto ficam em `AGENTS.md`. `CLAUDE.md` importa esse arquivo
para instalações do Claude Code que não carreguem AGENTS automaticamente.
A referência de memória e o helper são utilizáveis sem instalar a skill global:
`python tools/gta_memory.py`. Não é necessário duplicar a documentação por modelo.

## Pausa, foco da janela e modo janela

Manter o GTA pausado pode interromper a atualização do mundo do jogo (movimento
dos personagens, física e tráfego), a execução de alguns scripts e o processamento
dos comandos da ponte. Minimizar o jogo ou alternar para o chat também pode
interromper esse processamento, dependendo dos mods e da configuração.
Isso pode causar demora nas respostas ou erros de tempo limite.
`work-in-pause` não garante que todos os scripts e funções do jogo continuem
executando nessas condições.

Recomenda-se usar o [Windowed Mode](https://www.mixmods.com.br/2022/10/iii-vc-sa-windowed-mode/)
para facilitar a alternância entre o GTA e o cliente de IA. O mod também está
incluído no [Essentials Pack da MixMods](https://www.mixmods.com.br/2019/06/sa-essentials-pack/).
Usar modo janela, por si só, não garante que o jogo continue processando sem
foco: confira as configurações do mod e o comportamento dos scripts utilizados.

## Verificar o funcionamento

Faça a verificação no cliente que você utiliza, com o GTA em execução.

1. Configure o servidor e verifique se o cliente lista os cinco comandos da
   tabela acima. Isso confirma que o cliente reconhece o MCP, mas ainda não
   comprova a comunicação com o jogo.
2. Use o comando**`gta_get_status`** e na resposta confira os três indicadores explicados abaixo.
3. Peça à IA para executar o exemplo `moonloader/examples/mcp_read_cj_health.lua`
   com `gta_run_script`, usando seu caminho absoluto do Windows. Acompanhe
   `gta_get_command` até `completed` e confira o retorno `health` (vida do CJ).
   O valor depende da condição atual do personagem; não precisa ser 100.
4. Com `mcp_execution_test.lua`, confira retorno JSON com acentos e o relatório
   de um erro intencional (mensagem e rastreamento das chamadas). Verifique também
   cancelamento e tempo limite conforme `tests/live_execution.py`. Esses são
   testes adicionais para desenvolvimento.
5. Confirme que o cliente não reenvia automaticamente ações após timeout de
   transporte. Uma submissão pode ter sido aceita mesmo sem resposta ao cliente.

### Como interpretar `gta_get_status`

Este é apenas o trecho relevante de uma resposta esperada com o jogo conectado:

```json
{
  "connected": true,
  "moonloader_worker_ready": true,
  "simulated": false
}
```

| Indicador | Valor esperado | Significado |
|---|---|---|
| `connected` | `true` | O servidor EXE conseguiu se comunicar com a ponte do ASI. |
| `moonloader_worker_ready` | `true` | O script `mcp_bridge.lua` do MoonLoader está se comunicando com o ASI e pode receber comandos. |
| `simulated` | `false` | A resposta não veio da ponte simulada usada pelos testes. O objetivo aqui é conectar ao ASI carregado no GTA. |

Se `connected` for `false`, confira se o GTA está aberto e se o ASI foi instalado
e carregado; a resposta pode incluir um campo `error` com o motivo da falha.
Se a conexão funcionar, mas `moonloader_worker_ready` for `false`, confira o
MoonLoader, o arquivo `mcp_bridge.lua` e seu log; o jogo pausado ou sem foco
também pode suspender a comunicação. `simulated: true` indica um ambiente de
teste e não comprova acesso ao GTA real. Campos ausentes não equivalem a `false`.

Esses indicadores verificam a comunicação. O teste de leitura da vida do CJ,
no passo 3, verifica também a execução de Lua e a devolução dos dados.

## Compatibilidade

| Componente | Codex | Claude Code |
|---|---|---|
| Transporte MCP stdio | Implementado; uso real já validado | Suportado pelo cliente; teste deste servidor pendente |
| Execução Lua e retorno JSON no jogo | Validados no desenvolvimento | Pendente |
| Erros/cancelamento/tempo limite | Executor Lua e integração testados | Pendente |
| Chat F7 e percentuais da conta | Integração experimental existente | Não implementado |

Referências: [MCP no Codex](https://developers.openai.com/codex/mcp),
[MCP no Claude Code](https://code.claude.com/docs/en/mcp) e
[instruções do projeto no Claude Code](https://code.claude.com/docs/en/memory).
