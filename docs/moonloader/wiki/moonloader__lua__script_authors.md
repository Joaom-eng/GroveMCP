# script_authors | Modding Wiki

Fonte: https://wiki.blast.hk/moonloader/lua/script_authors

```lua
script_authors(string author, ...)
```

## Описание

Задаёт нескольких авторов скрипта. Имеет аналог с более подходящим названием для указания одного автора - [script_author](https://wiki.blast.hk/moonloader/lua/script_author).

## Аргументы

`string authors, ...` авторы скрипта

## Пример использования

```lua
script_authors("FYP", "hnnssy", "EvgeN 1137")

function main()
  print(unpack(thisScript().authors))
end
```
