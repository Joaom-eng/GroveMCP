# Класс LuaScript | Modding Wiki

Fonte: https://wiki.blast.hk/moonloader/lua/script

Определяет информацию о lua-скрипте и предоставляет функции для управления им.
 Поля класса разделены на свойства и функции.

## Свойства

Вызываются через точку. Пример `local name = scr.name`.

Тип |  Описание |

string name |  имя скрипта, заданное функцией 'script_name'. Если имя не задано используется название файла |

string description |  описание скрипта, указанное функцией 'script_description'. Пустая строка, если не указано |

int version_num |  числовая версия скрипта. 0, если не указано |

string version |  текстовая версия скрипта. Будет использована числовая версия, если не задано |

table authors |  список авторов скрипта. Пустой, если не указаны |

table dependencies |  список зависимостей скрипта. Пустой, если не указаны |

string path |  полный путь к файлу скрипта |

string filename |  название файла скрипта, включая расширение |

string directory |  полный путь директории, из который был загружен скрипт |

bool frozen |  статус активности потока (приостановлен/активен) |

bool dead |  статус существования потока. Есть случаи, когда поток уже завершён, а lua-объект скрипта ещё существует. Свойство `dead` проверяет объект скрипта на валидность |

any exports |  экспортируемые скриптом значения. Можно получить и функцией [import](https://wiki.blast.hk/moonloader/lua/import) |

int id |  уникальный идентификатор скрипта |

string url |  web-адрес скрипта |

table properties |  список свойств, заданных директивой [script_properties](https://wiki.blast.hk/moonloader/lua/script_properties) |

## Методы

Вызываются через двоеточие. Например, `scr:reload()`.

|   |

[pause](https://wiki.blast.hk/moonloader/lua/script/pause)() |  приостанавливает поток скрипта |

[resume](https://wiki.blast.hk/moonloader/lua/script/resume)() |  снимает остановленный поток с паузы |

[unload](https://wiki.blast.hk/moonloader/lua/script/unload)() |  выгружает скрипт |

[reload](https://wiki.blast.hk/moonloader/lua/script/reload)() |  перезагружает скрипт |

## Примеры

Пример функции, выводящей информацию о скрипте, из которого была вызвана и завершающей его.

```lua
function showInfoAndUnload()
  -- получаем объект текущего скрипта
  local scr = thisScript()
  -- выводим название, версию и список авторов в лог
  print(string.format("Name: %s, Version: %s, Authors: %s", scr.name, scr.version, table.concat(scr.authors, ", ")))
  -- принудительно завершаем скрипт
  scr:unload()
end
```
