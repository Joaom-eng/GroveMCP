# События Lua | Modding Wiki

Fonte: https://wiki.blast.hk/moonloader/events

События — это функции, вызывающиеся автоматически при определённых условиях. Обработчик события может быть зарегистрирован путём объявления глобальной функции с соответствующим названием, либо с помощью функции [addEventHandler](https://wiki.blast.hk/moonloader/lua/addEventHandler). Все аргументы и возвращаемые значения событий MoonLoader опциональны.

Версия |  Lua |

v.015 |  [main](https://wiki.blast.hk/moonloader/lua/main)() |

v.022 |  [onExitScript](https://wiki.blast.hk/moonloader/lua/onExitScript)(bool quitGame) |

v.015 |  [onQuitGame](https://wiki.blast.hk/moonloader/lua/onQuitGame)() |

v.015 |  [onScriptLoad](https://wiki.blast.hk/moonloader/lua/onScriptLoad)(LuaScript s) |

v.022 |  [onScriptTerminate](https://wiki.blast.hk/moonloader/lua/onScriptTerminate)(LuaScript s, bool quitGame) |

v.015 |  [onSystemInitialized](https://wiki.blast.hk/moonloader/lua/onSystemInitialized)() |

v.015 |  [onScriptMessage](https://wiki.blast.hk/moonloader/lua/onScriptMessage)(string msg, LuaScript s) |

v.015 |  [onSystemMessage](https://wiki.blast.hk/moonloader/lua/onSystemMessage)(string msg, int type, LuaScript s) |

v.015 |  bool process=true, int id, bitstream bitStream = [onReceivePacket](https://wiki.blast.hk/moonloader/lua/onReceivePacket)(int id, bitstream bitStream) |

v.015 |  bool process=true, int id, bitstream bitStream = [onReceiveRpc](https://wiki.blast.hk/moonloader/lua/onReceiveRpc)(int id, bitstream bitStream) |

v.015 |  bool process=true, int id, bitstream bitStream, int priority, int reliability, int orderingChannel = [onSendPacket](https://wiki.blast.hk/moonloader/lua/onSendPacket)(int id, bitstream bitStream, int priority, int reliability, int orderingChannel) |

v.015 |  bool process=true, int id, bitstream bitStream, int priority, int reliability, int orderingChannel, bool shiftTs = [onSendRpc](https://wiki.blast.hk/moonloader/lua/onSendRpc)(int id, bitstream bitStream, int priority, int reliability, int orderingChannel, bool shiftTs) |

v.022 |  [onWindowMessage](https://wiki.blast.hk/moonloader/lua/onWindowMessage)(uint msg, uint wparam, int lparam) |

v.023 |  [onStartNewGame](https://wiki.blast.hk/moonloader/lua/onStartNewGame)(int mpack) |

v.023 |  [onLoadGame](https://wiki.blast.hk/moonloader/lua/onLoadGame)(table saveData) |

v.023 |  table newSaveData = [onSaveGame](https://wiki.blast.hk/moonloader/lua/onSaveGame)(table saveData) |
