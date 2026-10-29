# Событие onSaveGame | Modding Wiki

Fonte: https://wiki.blast.hk/moonloader/lua/onSaveGame

```lua
table newSaveData = onSaveGame(table saveData)
```

## Описание

Срабатывает при сохранении игры, предназначено только для одиночной игры.
 Таблица `saveData` хранит данные сохранения, принадлежащие скрипту, они загружаются из JSON файла по пути `<Documents>\GTA San Andreas User Files\MoonLoader\save<id>.json`,
 где `<Documents>` -- это папка документов пользователя, а `<id>` -- номер сохранения от 1 до 8.
 Принадлежность данных сохранения определяется названием скрипта, которое задаётся директивой [script_name](https://wiki.blast.hk/moonloader/lua/script_name), либо именем файла, если название не задано.
 Значение `saveData` будет равно `nil`, если данные сохранения отсутствуют.
 Событие принимает возвращаемое значение -- таблицу, в которой хранятся новые данные сохранения, и если функция вернёт таблицу, то файл сохранения будет перезаписан (или создан) с новыми данными.
 Файл сохранения не будет перезаписан, если из события `onSaveGame` не было возвращено значение ни в одном из скриптов.

## Аргументы

`table saveData` данные сохранения

## Возвращаемые значения

`table newSaveData` новые данные сохранения

## Пример использования

Счётчик сохранений:

```lua
function onSaveGame(save)
  -- создаём новую таблицу, если значение save отсутствует
  -- этот фрагмент является компактным аналогом кода
  -- if save then save = save else save = {} end
  save = save or {}
  if save.save_counter then -- если в сохранении уже присутствует значение
    -- то увеличиваем счётчик на единицу
    save.save_counter = save.save_counter + 1
  else -- если отсутствует
    -- задаём единицу
    save.save_counter = 1
  end
  -- 'return save' запишет новые данные сохранения в файл
  return save
end
```

Другой пример использования в виде полноценного скрипта: [CollectVehicles](https://wiki.blast.hk/moonloader/examples/collectvehicles)

## См. также

- [onLoadGame](https://wiki.blast.hk/moonloader/lua/onLoadGame)
 
- [onStartNewGame](https://wiki.blast.hk/moonloader/lua/onStartNewGame)
