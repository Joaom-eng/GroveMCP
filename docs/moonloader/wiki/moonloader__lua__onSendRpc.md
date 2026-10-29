# Событие onSendRpc | Modding Wiki

Fonte: https://wiki.blast.hk/moonloader/lua/onSendRpc

Только SA:MP. Требует наличие плагина [SAMPFUNCS](https://wiki.blast.hk/sampfuncs).

```lua
bool send=true, int id, Bitstream bitStream, int priority, int reliability, int orderingChannel, bool shiftTs
  = onSendRpc(int id, Bitstream bitStream, int priority, int reliability, int orderingChannel, bool shiftTs)
```

## Описание

Выполняется перед отправкой RakNet-RPC. Данные в виде битстрима, ид RPC и его конфигурация передаются параметрами при вызове.
 Событие имеет все те же возвращаемые параметры, что и входящие, они предназначены для подмены значений.
 Самый первый параметр `bool send` отвечает за продолжение отправки RPC (true - будет отправлен, false - проигнорирован).
 Любые из всех параметров могут быть опущены, если в них нет нужды.

Совет: если не требуется подменять входящие значения и отменять отправку RPC, то не возвращайте никакие значения, включая параметр `send` - это увеличит производительность.

## Входящие значения

`int id` идентификатор пакета
 `Bitstream bitStream` данные
 `int priority` приоритет
 `int reliability` надёжность
 `int orderingChannel` канал
 `bool shiftTs` timestamp

## Возвращаемые значения

`bool send` передать на отправку
 `int id` идентификатор пакета
 `Bitstream bitStream` данные
 `int priority` приоритет
 `int reliability` надёжность
 `int orderingChannel` канал
 `bool shiftTs` timestamp
