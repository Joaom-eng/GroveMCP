# Preparar os arquivos da release

Compilar na raiz do repositório, em um terminal com MSBuild e Plugin-SDK configurados:

```powershell
msbuild .\McpServer.sln /t:Rebuild /p:Configuration=Release /p:Platform=GTA-SA /p:DeployToGame=false /m
python .\tools\package_release.py
```

O empacotador usa a versão do README, confere a versão anunciada pelo EXE e
recusa binários que não sejam PE32/x86, referências a PDB e exports ASI ausentes.
Não instala arquivos no GTA nem publica no GitHub. A compilação usa runtime C++
estático e não inclui símbolos de depuração no pacote.

Os arquivos em `dist` são:

- `GroveMCP-<versão>-windows-x86.zip`: núcleo pronto para uso e referências offline.
- `GroveMCP-<versão>-codex-chat.zip`: complemento opcional para a mesma pasta da release.
- `SHA256SUMS.txt`: hashes dos downloads.
- `RELEASE_NOTES.md`: texto para a descrição da release no GitHub.

Cada ZIP inclui um manifesto com versão e SHA256 de seus arquivos. Os nomes,
ordem e timestamps das entradas do ZIP são fixos para que entradas idênticas
gerem os mesmos arquivos compactados. Os próprios binários podem mudar entre
compilações devido a metadados do compilador/linker.

O empacotamento usa uma lista explícita. Exclui builds auxiliares, PDB/ILK/LIB,
testes e relatórios, histórico de conversas, `.local`, executáveis do jogo e
bibliotecas externas do MoonLoader/ImGui. Os exemplos e as referências da IA
permanecem disponíveis. A licença MIT do projeto e os avisos das dependências
estão nos pacotes.

Se os ZIPs já existirem, o comando não os sobrescreve. Para uma nova preparação,
use outro diretório com `--output <pasta>`; para outra versão, atualize também a
versão anunciada pelo servidor e a versão do README antes de compilar.

Antes de publicar, execute os testes e confira a instalação em uma cópia do GTA
preparada para teste. A integridade dos ZIPs e o handshake não substituem essa
verificação no jogo. O estado por cliente está em `CLIENTS.md`.
