# Событие onStartNewGame | Modding Wiki

Fonte: https://wiki.blast.hk/moonloader/lua/onStartNewGame

```lua
onStartNewGame(int mpackNumber)
```

## Описание

Срабатывает при старте новой игры, предназначено только для одиночной игры.
 Параметр `mpackNumber` - это номер пакета миссий.
 Система пакетов миссий не используется в оригинальной игре, но используется различными модами (например, DYOM).
 В оригинальной линии игры это значение равно нулю.

## Аргументы

`int mpackNumber` номер пакета миссий

## См. также

- [onLoadGame](https://wiki.blast.hk/moonloader/lua/onLoadGame)
 
- [onSaveGame](https://wiki.blast.hk/moonloader/lua/onSaveGame)
