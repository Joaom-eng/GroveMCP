# Preparar os arquivos da release

Este guia é destinado à manutenção do projeto. Para usar o GroveMCP, clone o
repositório (que inclui o EXE pronto), baixe os componentes do jogo na página
[Releases](https://github.com/Joaom-eng/GroveMCP/releases) e siga o README principal.

Compilar na raiz do repositório, em um terminal com MSBuild e Plugin-SDK configurados:

```powershell
msbuild .\McpServer.sln /t:Rebuild /p:Configuration=Release /p:Platform=GTA-SA /p:DeployToGame=false /m
python .\tools\package_release.py
```

O empacotador usa a versão do README, confere a versão anunciada pelo EXE e
recusa binários que não sejam PE32/x86, referências a PDB e exports ASI ausentes.
Não instala arquivos no GTA nem publica no GitHub. A compilação usa runtime C++
estático e não inclui símbolos de depuração no pacote.

O comando gera localmente os seguintes arquivos na pasta `dist`:

- `GroveMCP-<versão>-windows-x86.zip`: ASI e ponte Lua para extrair na raiz do GTA.
- `GroveMCP-<versão>-codex-chat.zip`: painel Lua opcional para extrair na raiz do GTA.
- `SHA256SUMS.txt`: hashes dos downloads.

Anexe esses três arquivos à release no GitHub. A pasta `dist` permanece no
`.gitignore`: os pacotes são distribuídos como anexos da release, não como
arquivos versionados junto ao código-fonte. Quem clona o repositório não precisa
ter essa pasta para consultar a documentação ou compilar o projeto.

Os ZIPs não contêm EXE, ferramentas Python, documentação ou manifestos. Esses
arquivos permanecem no repositório. A estrutura dos ZIPs já corresponde às
pastas do jogo; não há uma pasta intermediária `GroveMCP-<versão>`.

O SHA256 de cada ZIP fica no arquivo de checksums. Os nomes, ordem e timestamps
das entradas do ZIP são fixos para que entradas idênticas
gerem os mesmos arquivos compactados. Os próprios binários podem mudar entre
compilações devido a metadados do compilador/linker.

O pacote principal contém somente `McpServer.SA.asi`, `moonloader/mcp_bridge.lua`
e `moonloader/lib/mcp_runner.lua`. O complemento contém somente
`moonloader/mcp_ingame_chat.lua` e `moonloader/lib/mcp_chat_markdown.lua`.
Avisos de licença acompanham os componentes em cabeçalhos dos scripts Lua.
As dependências externas, como MoonLoader e MoonImGui, são instaladas separadamente.

Ao atualizar a versão, inclua no commit o EXE pronto de
`bin/Host/Release/McpServer.exe`, correspondente ao ASI publicado. O `.gitignore`
permite esse arquivo especificamente e continua excluindo os demais builds.

Se os ZIPs já existirem, o comando não os sobrescreve. Para uma nova preparação,
use outro diretório com `--output <pasta>`; para outra versão, atualize também a
versão anunciada pelo servidor e a versão do README antes de compilar.

Antes de publicar, execute os testes e confira a instalação em uma cópia do GTA
preparada para teste. A integridade dos ZIPs e o handshake não substituem essa
verificação no jogo. O estado por cliente está em `CLIENTS.md`.
