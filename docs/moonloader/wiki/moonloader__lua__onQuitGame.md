# Событие onQuitGame | Modding Wiki

Fonte: https://wiki.blast.hk/moonloader/lua/onQuitGame

```lua
onQuitGame()
```

## Описание

Выполняется при выходе из игры.

## Пример использования

```lua
-- ...
function onQuitGame()
  print("Saving settings...")
  saveSettings()
  print("Done.")
end
-- ...
```
