# Aplicação ao depurador MCP

O que faltava para produzir scripts com menos tentativa e erro era uma
referência central que juntasse assinatura, contexto permitido, dependências,
ciclo de vida, exemplo e versão. Esta base cobre parte importante disso; o
comportamento do GTA e os layouts de memória continuam exigindo outras fontes.

## Escolher a ferramenta certa

| Necessidade | Recurso apropriado |
|---|---|
| Resultado curto, erro/traceback ou teste de 30 segundos | `gta_run_script`, módulo que retorna function(ctx), ctx.publish e return. |
| Monitor residente com callbacks de eventos e UI | Script MoonLoader convencional por gta_load_script; manter seu ciclo de vida. |
| Descobrir por que outro Lua encerrou | Coletor independente com onScriptMessage, onSystemMessage, onScriptLoad e onScriptTerminate. |
| Mostrar UI por frame | onD3DPresent ou o callback da biblioteca ImGui realmente instalada. Coletar os dados fora da renderização. |
| Acompanhar tarefas/vida de peds | Leituras periódicas e histórico; informar intervalo e transições possivelmente perdidas. |
| Atribuir ALLOCATE_MEMORY a um CLEO | Hook do handler 0AC8 e acompanhamento de 0AC9; não há evento nativo documentado para isso. |
| Entender chamada de opcode | Buscar assinatura no índice/Gist/wiki e confrontar com a tabela de correspondência. Lua pode ter alternativas a opcodes removidos. |
| Inspecionar CTask/CPed ou instalar hook nativo | Plugin-SDK/análise do binário específico, validação de ponteiros, ABI e instruções. Eventos não substituem essa análise. |

Essas linhas indicam implementação ou possibilidades de uso, não significam que
o MCP já expõe cada coletor como ferramenta pronta. Atualmente a base é consultada
por arquivo/CLI; ainda não criamos `gta_search_docs` no protocolo MCP.

## Limites do runner atual

O runner captura loadfile, o corpo do módulo e a função retornada, inclusive
erros depois de wait. Não acompanha automaticamente callbacks assíncronos ou
threads adicionais criados pelo usuário. Ele já define main e onExitScript;
não substituí-los num módulo gerenciado para tentar construir um script
residente. Usar um script convencional para esse caso.

Timeout de Lua não impede crash nativo nem interrompe FFI bloqueado. Callbacks
FFI devem permanecer vivos enquanto código nativo puder chamá-los. Remover o
hook antes de liberar a função Lua. A documentação diferencia encerramento
normal de erro: onExitScript sozinho não deve ser tratado como garantia de
limpeza em todo cenário. Planejar também falhas/reload/saída do jogo.

`work-in-pause` não significa execução garantida quando o jogo está minimizado
ou sem foco. A página oficial condiciona o comportamento ao jogo aberto em
primeiro plano. Diagnosticar heartbeat/ticks antes de concluir que uma chamada
ou evento não existe. Ver [script_properties](wiki/moonloader__lua__script_properties.md).

## Separar camadas

- MoonLoader: eventos, funções Lua, script.load/list/get, threads e renderização.
- CLEO: execução de scripts SCM e handlers de opcodes; muitos têm wrappers Lua.
- GTA SA: entidades, tarefas, pools e memória do motor.
- MoonImGui 1.1.5: callback imgui.OnDrawFrame e sua implementação em imgui.lua.
- SA-MP/SAMPFUNCS/RakNet: APIs de multiplayer com dependências próprias.
- Nosso MCP: comandos gerenciados, snapshots JSON, resultados e cancelamento.

Evitar atribuir uma função à camada errada é tão importante quanto conhecer o
nome correto. Os arquivos locais de memória e renderização instalados são
úteis para conferir implementação, mas esta exportação não copia toda a
distribuição ou todos os mods do jogo.

## Próximas ferramentas de debug que esta base ajuda a construir

1. Coletor de logs e falhas de todos os scripts, com timestamp e script de origem.
2. Inventário de scripts e histórico de carga, reload e término.
3. Monitores de entidades com condições de parada e snapshots comparáveis.
4. Registro de hooks instalados e verificação de restauração.
5. Consulta de documentação local pelo próprio MCP, mantendo fonte e versão.

Não executar HTML/JavaScript de páginas salvas. A ferramenta de importação lê
somente o primeiro post técnico e preserva exemplos como texto. Consultar a
base não depende de verificadores de segurança ou de login do site original.
