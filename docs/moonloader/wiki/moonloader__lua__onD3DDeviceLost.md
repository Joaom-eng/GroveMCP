# Событие onD3DDeviceLost | Modding Wiki

Fonte: https://wiki.blast.hk/moonloader/lua/onD3DDeviceLost

```lua
onD3DDeviceLost()
```

## Описание

Выполняется перед вызовом IDirect3DDevice9::Reset. Используется для инвалидации всех рендер-ресурсов перед вызовом Reset.
 Подробнее: [https://msdn.microsoft.com/ru-ru/library/windows/desktop/bb174425(v=vs.85).aspx](https://msdn.microsoft.com/ru-ru/library/windows/desktop/bb174425(v=vs.85).aspx)

## Пример использования

```lua
-- ...
function onD3DDeviceLost()
  d3dxfont.vtbl.OnLostDevice(d3dxfont)
end
-- ...
```
