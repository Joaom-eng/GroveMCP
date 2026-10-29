# Событие onWindowMessage | Modding Wiki

Fonte: https://wiki.blast.hk/moonloader/lua/onWindowMessage

```lua
onWindowMessage(uint msg, uint wparam, int lparam) 
```

## Описание

Вызывается при получении основным окном игры оконного сообщения Windows. Его можно проигнорировать из скрипта, вызвав функцию [consumeWindowMessage](https://wiki.blast.hk/moonloader/lua/consumeWindowMessage) изнутри события.
 Информация об оконных сообщениях доступна на [MSDN](https://msdn.microsoft.com/ru-ru/library/windows/desktop/ms644927(v=vs.85).aspx#system_defined).

## Входящие значения

`uint msg` идентификатор сообщения
 `uint wparam` первый параметр
 `int lparam` второй параметр
