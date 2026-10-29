script_name('MCP Ped Lines')
script_author('McpServer project')
script_description('Screen-space lines from CJ to every ped on screen. F10 toggles.')

local peds = {}
local enabled, active, reported = true, false, false
local COLOR = 0xCC55FF99 -- ARGB
local WIDTH = 1.5
local HEIGHT = 0.65 -- Anchor near the torso, instead of the ped's feet.

local function project(ped)
    local x, y, z = getCharCoordinates(ped)
    if not isPointOnScreen(x, y, z + HEIGHT, 0.1) then return end
    local sx, sy = convert3DCoordsToScreen(x, y, z + HEIGHT)
    local w, h = getScreenResolution()
    if sx == sx and sy == sy and sx >= 0 and sy >= 0 and sx <= w and sy <= h then
        return sx, sy
    end
end

-- Render in the MoonLoader Present callback, not in the main update loop.
function onD3DPresent()
    if not active or not enabled or isPauseMenuActive() or not doesCharExist(PLAYER_PED) then return end
    local cx, cy = project(PLAYER_PED)
    if not cx then return end
    local drawn = 0
    for _, entry in ipairs(peds) do
        if doesCharExist(entry.handle) and getCharPointer(entry.handle) == entry.pointer
            and isCharOnScreen(entry.handle) then
            local px, py = project(entry.handle)
            if px then
                renderDrawLine(cx, cy, px, py, WIDTH, COLOR)
                drawn = drawn + 1
            end
        end
    end
    if drawn > 0 and not reported then
        -- Log only once; no per-frame I/O spam.
        print('MCP Ped Lines: Present drew lines to ' .. drawn .. ' peds. F10 toggles.')
        reported = true
    end
end

function onExitScript() active = false end

function main()
    active = true
    print('MCP Ped Lines: enabled; F10 toggles the overlay.')
    while true do
        if isKeyJustPressed(0x79) then
            enabled = not enabled
            printStringNow(enabled and '~g~MCP: linhas ativadas' or '~r~MCP: linhas desativadas', 2000)
        end
        local updated = {}
        if enabled and doesCharExist(PLAYER_PED) then
            for _, ped in ipairs(getAllChars()) do
                if ped ~= PLAYER_PED and doesCharExist(ped) then
                    updated[#updated + 1] = {handle = ped, pointer = getCharPointer(ped)}
                end
            end
        end
        peds = updated
        wait(0)
    end
end
