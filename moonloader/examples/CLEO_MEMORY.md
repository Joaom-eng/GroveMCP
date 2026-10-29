# Rastreamento de memoria CLEO em Lua

`mcp_cleo_memory.lua` troca as duas entradas de `customOpcodeHandlers` referentes
a `0AC8` e `0AC9` por callbacks LuaJIT `uint8_t __stdcall(void*)`. Cada callback
executa o handler original uma vez e retorna seu resultado. Nao altera o ASI.

Compativel com o binario verificado:

- GTA SA 1.0 US, MoonLoader 0.27 / LuaJIT 32 bits, MoonImGui instalado.
- CLEO 4.4.4, SHA256 `748EA0B36A1580652146C8B443066BDD81EF14556431805B2102F0F1F44CAA08`.
- RVAs da tabela: `0x45760` / `0x45764`; handlers: `0x60F0` / `0x6180`.
- Verifica versao, ponteiros das duas entradas e assinaturas dos handlers antes
  de escrever; os RVAs nao sao portaveis para outra compilacao do CLEO.

## Uso

Carregar com `gta_load_script` o caminho absoluto para o arquivo instalado em
`<pasta-do-GTA>/mcp_scripts/mcp_cleo_memory.lua`.
O script mostra um painel ImGui e grava `mcp_scripts/cleo_memory_snapshot.json`
a cada 500 ms. Inclui dono, ponteiro da thread, bytes observados, blocos,
pico e os ultimos 256 eventos. O rastreamento continua ate ser encerrado.

Para parar, criar o arquivo vazio `mcp_scripts/cleo_memory.stop` na pasta do
jogo. O monitor restaura os handlers e registra `installed:false` no JSON.
Encerrar o script pelo MoonLoader tambem executa a restauracao.

## Validacao

Ao instalar, quatro testes usam uma estrutura CRunningScript privada e os
handlers reais: inteiro de 32 bits, inteiro de 8 bits, inteiro de 16 bits e
variavel local. Validam tamanho observado, saida, condicao, IP e liberacao.

`mcp_cleo_memory_test.lua` gera em `mcp_scripts` um bytecode CLEO curto e o inicia
pela API `CLEO_CreateCustomScript`. A thread real `mcpmem01` aloca 4096 bytes,
depois 8192 bytes, e libera ambos, com esperas de 5 segundos. Termina sozinha.
O resultado da execucao inicial esta em `tests/cleo_memory_live_result.json`.
Tambem foi verificada a parada e a restauracao das entradas originais.

## Escopo e limites

- Comeca a contar no momento da instalacao, sem reconstruir alocacoes anteriores.
- Mede bytes solicitados por 0AC8, sem overhead do heap ou outras APIs.
- Libera a contagem do dono original mesmo quando outra thread chama 0AC9.
- Nome e um identificador interno de oito caracteres, nao necessariamente o arquivo.
- Se uma thread sai da lista ativa, sua identidade e esquecida para futuras
  alocacoes; seus blocos pendentes continuam atribuidos ao registro antigo.
  Reutilizacao do mesmo endereco/base entre duas consultas de 500 ms pode nao
  ser distinguida. Nao e uma identidade de ciclo de vida garantida pelo CLEO.
- Liberacoes fora de 0AC9 (incluindo limpeza global ao carregar um jogo salvo)
  nao sao interceptadas. Pare e reinicie o monitor ao carregar um jogo salvo
  ou iniciar um novo jogo.
- Erros de observacao aparecem no JSON. Um ponteiro reutilizado sem liberacao
  observada e sinalizado, sem fingir que os totais continuam completos.
- Nao executa I/O, ImGui ou wait dentro dos hooks. Callbacks ficam ancorados,
  o JIT desta unidade e desativado e as entradas sao restauradas ao encerrar.

Fonte consultada: https://github.com/cleolibrary/CLEO4/blob/master/source/CCustomOpcodeSystem.cpp
Os enderecos e a ABI foram confirmados no binario local pelo IDA.
