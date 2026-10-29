# GroveMCP @VERSION@ — complemento Codex Chat

Complemento experimental para conversar com uma sessão própria do Codex dentro
do GTA, usando F7. Requer o pacote principal GroveMCP @VERSION@.
Ainda não há relay para Claude Code. O uso do Codex consome o limite da conta
normalmente, como uma consulta no cliente.

## Instalar

1. Extraia este complemento na mesma pasta onde extraiu o pacote principal.
2. Instale a biblioteca MoonImGui (`imgui`) no MoonLoader. O complemento não
   inclui a biblioteca e não usa `mimgui`.
3. Copie `moonloader/lib/mcp_chat_markdown.lua` para `moonloader/lib` do GTA e
   `moonloader/examples/mcp_ingame_chat.lua` para `moonloader` do GTA.
4. Instale Python 3 e Codex CLI, faça login no Codex e configure o MCP conforme
   o README principal. Use uma CLI atualizada com acesso ao modelo desejado.
5. Na pasta da release, inicie o relay (substitua os caminhos de exemplo):

```powershell
& '.\tools\start_ingame_chat.ps1' -GameRoot 'C:\path\to\GTA San Andreas' -Python 'C:\path\to\python.exe'
```

O painel carrega com o GTA; F7 abre e fecha a janela. Para um jogo já aberto,
`gta_load_script` pode carregar o painel uma vez. Evite carregar cópias duplicadas.

O relay permanece ativo quando o painel ou o GTA são fechados. Inicie-o novamente
após reiniciar o computador. Consulte `docs/INGAME_CHAT.md` para parar o relay,
interpretar as barras de uso e entender os limites de cancelamento.

O histórico e as respostas ficam em `mcp_scripts/chat` na pasta do GTA. Este
complemento cria uma sessão própria; não envia mensagens para um chat já aberto
no aplicativo do Codex. As barras mostram o uso da conta inteira.
