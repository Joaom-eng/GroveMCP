# Событие onD3DPresent | Modding Wiki

Fonte: https://wiki.blast.hk/moonloader/lua/onD3DPresent

```lua
onD3DPresent()
```

## Описание

Выполняется перед вызовом IDirect3DDevice9::Present. Внутри этого события можно использовать средства DirectX для рендера поверх игры.

## Пример использования

```lua
-- ...
function onD3DPresent()
  d3dxfont.vtbl.DrawTextA(d3dxfont, nil, 'text', -1, prect, 0, 0xFFFFFFFF)
end
-- ...
```
