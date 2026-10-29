# script_moonloader | Modding Wiki

Fonte: https://wiki.blast.hk/moonloader/lua/script_moonloader

```lua
script_moonloader(int version)
```

## Описание

Задаёт минимальную требуемую версию MoonLoader. Если версия не соответствует, выводит сообщение об ошибке, но не прекращает работу скрипта.

## Аргументы

`int version` версия

## Пример использования

```lua
script_author("Example")
script_moonloader(16)

function main()
  -- ...
end
```
