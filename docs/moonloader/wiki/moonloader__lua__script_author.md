# script_author | Modding Wiki

Fonte: https://wiki.blast.hk/moonloader/lua/script_author

```lua
script_author(string author, ...)
```

## Описание

Задаёт автора или нескольких авторов скрипта. Имеет аналог с более подходящим названием для указания нескольких авторов - [script_authors](https://wiki.blast.hk/moonloader/lua/script_authors).

## Аргументы

`string author` автор скрипта

## Пример использования

```lua
script_author("Example")

function main()
  print(unpack(thisScript().author)) -- Example
end
```
