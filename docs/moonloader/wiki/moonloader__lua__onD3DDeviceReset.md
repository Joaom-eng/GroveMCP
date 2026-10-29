# Событие onD3DDeviceReset | Modding Wiki

Fonte: https://wiki.blast.hk/moonloader/lua/onD3DDeviceReset

```lua
onD3DDeviceReset()
```

## Описание

Выполняется после вызова IDirect3DDevice9::Reset. Используется для реинициализации всех рендер-ресурсов после инвалидации.
 Подробнее: [https://msdn.microsoft.com/ru-ru/library/windows/desktop/bb174425(v=vs.85).aspx](https://msdn.microsoft.com/ru-ru/library/windows/desktop/bb174425(v=vs.85).aspx)

## Пример использования

```lua
-- ...
function onD3DDeviceReset()
  d3dxfont.vtbl.OnResetDevice(d3dxfont)
end
-- ...
```
