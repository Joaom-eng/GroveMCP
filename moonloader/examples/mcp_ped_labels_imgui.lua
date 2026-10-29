script_name('MCP Ped Labels ImGui')
script_author('McpServer project')
script_description('60-second ped inspection overlay drawn by MoonImGui.')

local imgui = require 'imgui'
local bit = require 'bit'
local active = false
local entries = {}
local models = {[0] = 'player'}
local reported = false

imgui.ShowCursor = false
imgui.LockPlayer = false
imgui.DisableInput = true
imgui.RenderInMenu = false

local flags = bit.bor(imgui.WindowFlags.NoTitleBar, imgui.WindowFlags.NoResize,
    imgui.WindowFlags.NoMove, imgui.WindowFlags.NoScrollbar,
    imgui.WindowFlags.AlwaysAutoResize, imgui.WindowFlags.NoSavedSettings,
    imgui.WindowFlags.NoInputs, imgui.WindowFlags.NoFocusOnAppearing)

local function load_models()
    local root = getWorkingDirectory():gsub('[/\\]moonloader[/\\]?$', '')
    local file = io.open(root .. '/data/peds.ide', 'r')
    if not file then return end
    for line in file:lines() do
        local id, name = line:match('^%s*(%d+)%s*,%s*([^,%s]+)')
        if id and tonumber(id) ~= 0 then models[tonumber(id)] = name end
    end
    file:close()
end

function imgui.OnDrawFrame()
    if not active or isPauseMenuActive() then return end
    local drawn = 0
    imgui.PushStyleColor(imgui.Col.WindowBg, imgui.ImVec4(0.02, 0.02, 0.02, 0.72))
    for _, entry in ipairs(entries) do
        if doesCharExist(entry.ped) and getCharPointer(entry.ped) == entry.pointer then
            local x, y, z = getCharCoordinates(entry.ped)
            if isPointOnScreen(x, y, z, 0.5) then
                local sx, sy = convert3DCoordsToScreen(x, y, z + 1.15)
                if sx == sx and sy == sy then
                    imgui.SetNextWindowPos(imgui.ImVec2(sx, sy), imgui.Cond.Always, imgui.ImVec2(0.5, 1))
                    imgui.Begin('##mcp_ped_' .. entry.ped, nil, flags)
                    imgui.TextColored(entry.color, entry.text)
                    imgui.End()
                    drawn = drawn + 1
                end
            end
        end
    end
    imgui.PopStyleColor()
    if drawn > 0 and not reported then
        print('MCP Ped Labels ImGui: OnDrawFrame rendered ' .. drawn .. ' ped panels.')
        reported = true
    end
end

function onExitScript()
    active = false
    imgui.Process = false
end

function main()
    load_models()
    local started = getGameTimer()
    active = true
    imgui.Process = true
    print('MCP Ped Labels ImGui: overlay started for 60 seconds of game time.')
    while getGameTimer() - started < 60000 do
        local updated = {}
        for _, ped in ipairs(getAllChars()) do
            if doesCharExist(ped) then
                local model = getCharModel(ped)
                local male = isCharMale(ped)
                local pointer = getCharPointer(ped)
                updated[#updated + 1] = {
                    ped = ped,
                    pointer = pointer,
                    color = male and imgui.ImVec4(0.5, 0.86, 1, 1) or imgui.ImVec4(1, 0.63, 0.82, 1),
                    text = string.format('Sexo: %s\nMemoria: 0x%08X\nVida: %d\nModelo: %s [%d]',
                        male and 'masculino' or 'feminino', pointer, getCharHealth(ped),
                        models[model] or 'desconhecido', model)
                }
            end
        end
        entries = updated
        wait(200)
    end
    active = false
    imgui.Process = false
    print('MCP Ped Labels ImGui: 60 seconds elapsed; overlay removed.')
end
