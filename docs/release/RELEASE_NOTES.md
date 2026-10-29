# GroveMCP v@VERSION@

Release experimental para GTA San Andreas PC 1.0 US no Windows.

O GroveMCP conecta agentes de IA ao jogo para criar, executar e depurar scripts
Lua por MoonLoader. O servidor MCP utiliza stdio e um plugin ASI local.

## Downloads

- **GroveMCP-@VERSION@-windows-x86.zip**: pacote principal com EXE, ASI, ponte
  MoonLoader, executor Lua, exemplos e documentação offline para a IA.
- **GroveMCP-@VERSION@-codex-chat.zip**: complemento opcional do painel F7 com
  relay Codex CLI, histórico e indicadores de uso da conta. Requer o pacote principal.
- **SHA256SUMS.txt**: hashes dos dois ZIPs para conferir o download.

## Recursos

- Cinco ferramentas MCP para consultar a conexão, carregar scripts, executar
  módulos Lua com retorno JSON, acompanhar resultados e solicitar cancelamento.
- Resultados parciais, mensagens de erro Lua e tempo limite configurável.
- Referências offline de MoonLoader e de memória do GTA SA, com helper de busca
  e skill `gta-sa-memory`.
- Código original do GroveMCP sob licença MIT; créditos de terceiros preservados.

## Instalação e suporte

Extraia o pacote principal e siga seu `README.md`. Não extraia todo o conteúdo
diretamente na pasta do GTA. Atualize EXE, ASI e ponte Lua em conjunto, com o jogo
fechado para substituir o ASI. ASI Loader e MoonLoader são instalados separadamente.

O núcleo foi utilizado com o Codex. Há instruções de configuração para Claude
Code, mas a validação end-to-end nesse cliente ainda está pendente. O chat F7
é exclusivo do Codex nesta versão. Windows nativo é o ambiente de referência;
WSL, Wine e outras versões do jogo não foram validados.

Consulte `docs/CLIENTS.md` para ferramentas, configuração e observações sobre
pausa/perda de foco. Scripts têm acesso ao processo do jogo; cancelamento não
desfaz alterações já realizadas.
