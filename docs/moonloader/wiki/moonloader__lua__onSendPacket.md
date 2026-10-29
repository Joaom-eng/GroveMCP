# Событие onSendPacket | Modding Wiki

Fonte: https://wiki.blast.hk/moonloader/lua/onSendPacket

Только SA:MP. Требует наличие плагина [SAMPFUNCS](https://wiki.blast.hk/sampfuncs).

```lua
bool send=true, int id, Bitstream bitStream, int priority, int reliability, int orderingChannel
  = onSendPacket(int id, Bitstream bitStream, int priority, int reliability, int orderingChannel)
```

## Описание

Выполняется перед отправкой RakNet-пакета. Данные в виде битстрима, ид пакета и его конфигурация передаются параметрами при вызове.
 Событие имеет все те же возвращаемые параметры, что и входящие, они предназначены для подмены значений.
 Самый первый параметр `bool send` отвечает за продолжение отправки пакета (true - будет отправлен, false - проигнорирован).
 Любые из всех параметров могут быть опущены, если в них нет нужды.

Совет: если не требуется подменять входящие значения и отменять отправку пакета, то не возвращайте никакие значения, включая параметр `send` - это повысит производительность.

## Входящие значения

`int id` идентификатор пакета
 `Bitstream bitStream` данные
 `int priority` приоритет
 `int reliability` надёжность
 `int orderingChannel` канал

## Возвращаемые значения

`bool send` передать на отправку
 `int id` идентификатор пакета
 `Bitstream bitStream` данные
 `int priority` приоритет
 `int reliability` надёжность
 `int orderingChannel` канал
