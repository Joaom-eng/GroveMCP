# Referência de memória do GTA San Andreas PC

Export CME IDA (`cme.ida-ir`, versão 1), gerado em 18/10/2026: **21.734 funções,
30.743 símbolos, 1.575 tipos e 10 segmentos**. Inclui declarações, argumentos,
endereços VA/RVA, classes, enums, campos, offsets em bits/bytes e comentários.

O arquivo `gta_sa.cme.json.gz` contém o JSON completo, compactado de cerca de
119 MB para 3,5 MB. Não exige Git LFS nem bibliotecas Python adicionais. Os dois
caminhos absolutos da máquina que exportou o IDA foram reduzidos a nomes de
arquivo. O original intacto fica em `.local/reference-originals`, ignorado pelo
Git; não é necessário para as consultas. `manifest.json` preserva hashes do
original e da versão distribuída, metadados, contagens e campos sanitizados.

## Consultar sem carregar tudo no contexto

Na raiz do repositório:

```powershell
python .\tools\gta_memory.py info
python .\tools\gta_memory.py search GetWantedLevel --kind functions --limit 5
python .\tools\gta_memory.py type CPed --field Health
python .\tools\gta_memory.py type CPed --offset 0x47C
python .\tools\gta_memory.py address 0x41BE60
```

As respostas são JSON limitado ao pedido. `search` aceita `--kind` e `--exact`;
`type` mostra campos e aceita filtro por nome ou byte contido no campo;
`address` encontra um símbolo no endereço ou a função que o contém. O limite
máximo por consulta é 100; o resultado avisa quando foi truncado. A consulta por
tipo não percorre automaticamente campos aninhados ou ponteiros.

A skill versionada está em `skills/gta-sa-memory`. Para usá-la em outra máquina,
copie essa pasta para o diretório de skills do seu cliente. Ela inclui o helper
e descobre a referência a partir do diretório atual. Se o banco estiver em outro
lugar, use `--db` antes do subcomando ou a variável `GTA_SA_MEMORY_DB`.

## Compatibilidade e confiança

O export descreve PE x86 de 32 bits, little-endian, image base preferida
`0x400000`, MD5 informado `667f799c4ba8c9e1054fccaea6d4259b`. O tamanho do input
foi exportado como zero, o CRC32 como zero e não há SHA256 do executável: esses
valores não comprovam identificação completa. Não foi feita uma comparação do
executável atualmente carregado com esse export nesta integração.

As assinaturas e os layouts são anotações da base IDA, podendo conter hipóteses.
Preservar `type_source`, declaração e convenção textual; o inteiro exportado
`calling_convention` não deve ser usado isoladamente para gerar casts.
Para acessar uma instância, distinguir handle, ponteiro e endereço global;
revalidar a instância e aplicar o offset com o tamanho/tipo corretos.

O arquivo **não inclui assembly, pseudocódigo ou xrefs**. Para inspecionar corpos,
resolver assinaturas ambíguas, preparar hooks ou validar um comportamento, usar
o MCP do IDA Pro. O helper apenas pesquisa documentação, sem conectar ao jogo
ou executar qualquer chamada de memória.
