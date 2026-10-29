# Eventos: referência prática para este projeto

Este é um resumo em português das fontes arquivadas, não uma lista de eventos
inventada a partir de exemplos. Assinaturas completas: [events.json](events.json).
Fontes: [wiki de eventos](wiki/moonloader__events.md),
[referência do autor](raw/moonloader_reference.lua) e
[guia de desenvolvimento](forum-guide.md).

## Registro e execução

Um handler pode ser uma função global com o nome do evento ou uma função
registrada por `addEventHandler(nome, callback)`. A wiki descreve argumentos e
retornos dos eventos como opcionais; para retornos que modificam comportamento,
seguir a página específica em vez de devolver valores arbitrários.

```lua
-- Script MoonLoader convencional: usar gta_load_script.
script_name('Debug de ciclo de vida')

addEventHandler('onScriptLoad', function(s)
    print('Script carregado: ' .. tostring(s.name))
end)

function onScriptTerminate(s, quitGame)
    print('Script encerrando: ' .. tostring(s.name))
end

function main()
    wait(-1) -- mantém o script com main() residente para receber eventos
end
```

O guia informa que `wait` deve ser usado em `main` ou nos scripting threads,
inclusive em chamadas aninhadas. Não usar `wait` diretamente em handlers comuns.
Se um handler precisar iniciar uma tarefa que espera, criar `lua_thread.create`.
Esses threads são cooperativos, não threads nativas independentes. A página de
[threads](wiki/moonloader__scripting__threads.md) também distingue `wait(-1)` do
main do comportamento dos threads auxiliares.

Um script só com eventos e sem main pode permanecer ativo; se houver main e ele
retornar, o guia orienta mantê-lo vivo com `wait(-1)` quando desejado. No runner
MCP, retornar é intencional: finaliza a execução gerenciada e seu relatório.

## Ciclo de vida e mensagens

| Assinatura | Uso e restrições documentados |
|---|---|
| `main()` | Entrada após o carregamento do jogo; pode usar wait. |
| `onSystemInitialized()` | Após carregar os scripts e antes do loop principal. Não presumir que se repete ao carregar um script depois. |
| `onScriptLoad(LuaScript s)` | Observar carregamento de scripts. |
| `onScriptTerminate(LuaScript s, bool quitGame)` | Antes da descarga de qualquer script; a wiki diz que ocorre antes de onExitScript e também em término por erro. |
| `onExitScript(bool quitGame)` | No próprio script antes do encerramento **normal**. Não prometer que sozinho cobre erros ou crash nativo. |
| `onQuitGame()` | Antes de sair do jogo. |
| `onScriptMessage(string msg, LuaScript s)` | Mensagens de scripts enviadas ao log. Evitar print dentro desse handler: pode disparar o próprio evento novamente. |
| `onSystemMessage(string msg, int type, LuaScript s)` | Mensagens do MoonLoader; útil para coletar erros e avisos, com tipo e script de origem. |

Para detalhes de encerramento:
[onScriptTerminate](wiki/moonloader__lua__onScriptTerminate.md) e
[onExitScript](wiki/moonloader__lua__onExitScript.md).
Um coletor independente de logs/ciclo de vida é mais útil que depender apenas
do script sob investigação, especialmente quando ele falha.

## Renderização e janela

| Assinatura | Uso e limites |
|---|---|
| `onD3DPresent()` | Antes de IDirect3DDevice9::Present; a wiki o indica para renderizar sobre o jogo. Não aguardar, fazer I/O pesado ou coletar todos os dados nesse callback. |
| `onD3DDeviceLost()` | Antes de Reset, para invalidar recursos de renderização conforme a API usada. |
| `onD3DDeviceReset()` | Após Reset para restaurar os recursos apropriados. |
| `onWindowMessage(uint msg, uint wparam, int lparam)` | Mensagens da janela; para consumir uma mensagem, consultar a API específica em vez de presumir que return false basta. |

Fontes: [Present](wiki/moonloader__lua__onD3DPresent.md),
[Lost](wiki/moonloader__lua__onD3DDeviceLost.md),
[Reset](wiki/moonloader__lua__onD3DDeviceReset.md),
[janela](wiki/moonloader__lua__onWindowMessage.md).

`imgui.OnDrawFrame` é callback da biblioteca MoonImGui; não é um evento nativo do
MoonLoader. Na versão 1.1.5 instalada, `imgui.lua` registra um handler de
`onD3DPresent` e chama `BeforeDrawFrame`/`OnDrawFrame` no seu fluxo de renderização.
Não misturar automaticamente exemplos dessa biblioteca com `mimgui`.
Usar Present não garante, sozinho, estados corretos de depth/stencil, escala ou
ordem entre vários overlays. São questões adicionais de renderização.

## Novo jogo e arquivos salvos

| Assinatura | Uso |
|---|---|
| `onStartNewGame(int mpack)` | Notificação de início de um novo jogo. |
| `onLoadGame(table saveData)` | Dados de save do script; a wiki informa que podem ser nil se ausentes. Não é uma estrutura completa do save nativo do GTA. |
| `table newSaveData = onSaveGame(table saveData)` | Persistência de dados do script junto ao sistema de saves do MoonLoader. |

Consultar [onLoadGame](wiki/moonloader__lua__onLoadGame.md) e
[onSaveGame](wiki/moonloader__lua__onSaveGame.md) antes de salvar dados.

## Rede: manter separado do single-player

As assinaturas `onReceiveRpc`, `onReceivePacket`, `onSendRpc` e `onSendPacket`
estão na referência do autor e têm páginas locais. Envolvem bitstreams, IDs e
parâmetros de envio/recebimento. Sua utilidade e disponibilidade dependem do
ambiente de rede instalado; não são eventos genéricos de IA dos NPCs do GTA.
Não confundir esses eventos nativos com eventos de alto nível de bibliotecas
como SAMP.Lua. Verificar a página e as dependências de cada integração.

## O que não está documentado como evento nativo

Não encontramos nesta referência eventos como `onPedTaskChanged`,
`onCleoAllocateMemory` ou `onPedHealthChanged`. Nossos monitores dessas mudanças
usam amostragem ou hooks específicos. Não apresentar esses nomes como APIs
existentes sem uma fonte adicional. Amostragem pode perder transições entre
duas leituras; um hook captura outro ponto do fluxo, com exigências de ABI e
ciclo de vida próprias.
