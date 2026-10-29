# Событие onLoadGame | Modding Wiki

Fonte: https://wiki.blast.hk/moonloader/lua/onLoadGame

```lua
onLoadGame(table saveData)
```

## Описание

Срабатывает при загрузке сохранённой игры, предназначено только для одиночной игры.
 Таблица `saveData` хранит данные сохранения, принадлежащие скрипту, они загружаются из JSON файла по пути `<Documents>\GTA San Andreas User Files\MoonLoader\save<id>.json`,
 где `<Documents>` - это папка документов пользователя, а `<id>` - номер сохранения от 1 до 8.
 Принадлежность данных сохранения определяется названием скрипта, которое задаётся директивой [script_name](https://wiki.blast.hk/moonloader/lua/script_name), либо именем файла, если название не задано. Файл сохранения создаётся автоматически при успешном выполнении события [onSaveGame](https://wiki.blast.hk/moonloader/lua/onSaveGame).
 Значение `saveData` будет равно `nil`, если данные сохранения отсутствуют.

## Аргументы

`table saveData` данные сохранения

## См. также

- [onStartNewGame](https://wiki.blast.hk/moonloader/lua/onStartNewGame)
 
- [onSaveGame](https://wiki.blast.hk/moonloader/lua/onSaveGame)
