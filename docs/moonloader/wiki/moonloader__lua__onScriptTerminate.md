# Событие onScriptTerminate | Modding Wiki

Fonte: https://wiki.blast.hk/moonloader/lua/onScriptTerminate

```lua
onScriptTerminate(LuaScript s, bool quitGame)
```

## Описание

Вызывается перед выгрузкой любого скрипта. Выполняется перед вызовом [onExitScript](https://wiki.blast.hk/moonloader/lua/onExitScript) и даже если скрипт завершился с ошибкой.

## Входящие значения

`LuaScript s` скрипт
 `bool quitGame` будет иметь значение `true`, если скрипт был завершён в связи с выходом из игры
