script_name('MCP Ped Labels')
script_author('McpServer project')
script_version('0.3.0')
script_description('Temporary, read-only ped inspection overlay: 60 seconds.')

local font
local active = false
local entries = {}
local reported = false
local models = {[0] = 'player'}
local ffi = require 'ffi'
local savedStates = ffi.new('uint32_t[4]')
local stateIds = {7, 14, 23, 52} -- ZENABLE, ZWRITEENABLE, ZFUNC, STENCILENABLE
local overlayStates = {0, 0, 8, 0} -- No depth/stencil rejection; comparison ALWAYS.
local device, getState, setState

local function begin_overlay()
    local pointer = getD3DDevicePtr()
    if pointer == 0 then return false end
    device = ffi.cast('void*', pointer)
    local vtable = ffi.cast('void***', device)[0]
    -- Slots verified against IDirect3DDevice9 in the Plugin-SDK d3d9.h.
    getState = ffi.cast('long (__stdcall*)(void*, uint32_t, uint32_t*)', vtable[58])
    setState = ffi.cast('long (__stdcall*)(void*, uint32_t, uint32_t)', vtable[57])
    -- Read every state before changing anything, so failed reads cannot leave
    -- partially modified game rendering state.
    for index, id in ipairs(stateIds) do
        if getState(device, id, savedStates + index - 1) ~= 0 then return false end
    end
    for index, id in ipairs(stateIds) do setState(device, id, overlayStates[index]) end
    return true
end

local function end_overlay()
    for index, id in ipairs(stateIds) do setState(device, id, savedStates[index - 1]) end
end

local function load_models()
    local root = getWorkingDirectory():gsub('[/\\]moonloader[/\\]?$', '')
    local file = io.open(root .. '/data/peds.ide', 'r')
    if not file then
        print('MCP Ped Labels: peds.ide unavailable; unknown models use their ID.')
        return
    end
    for line in file:lines() do
        local id, name = line:match('^%s*(%d+)%s*,%s*([^,%s]+)')
        if id and tonumber(id) ~= 0 then models[tonumber(id)] = name end
    end
    file:close()
end

local function cleanup()
    active = false
    if font then renderReleaseFont(font); font = nil end
end

function onExitScript() cleanup() end

-- Draw immediately before the completed frame is presented, rather than during
-- game processing where later world/HUD passes can cover the text.
local function draw_labels()
    local drawn = 0
    for _, entry in ipairs(entries) do
        local ped = entry.ped
        if doesCharExist(ped) and getCharPointer(ped) == entry.pointer then
            local x, y, z = getCharCoordinates(ped)
            if isPointOnScreen(x, y, z, 0.5) then
                local sx, sy = convert3DCoordsToScreen(x, y, z + 1.15)
                if sx == sx and sy == sy then
                    for index, line in ipairs(entry.lines) do
                        local width = renderGetFontDrawTextLength(font, line)
                        renderFontDrawText(font, line, sx - width / 2, sy - 56 + (index - 1) * 14, entry.color)
                    end
                    drawn = drawn + 1
                end
            end
        end
    end
    if not reported and drawn > 0 then
        print(string.format('MCP Ped Labels: depth-disabled Present pass rendered %d labels; original Z=%d ZWrite=%d ZFunc=%d stencil=%d.',
            drawn, tonumber(savedStates[0]), tonumber(savedStates[1]), tonumber(savedStates[2]), tonumber(savedStates[3])))
        reported = true
    end
end

function onD3DPresent()
    if not active or not font or isPauseMenuActive() then return end
    if not begin_overlay() then return end
    local ok, message = xpcall(draw_labels, debug.traceback)
    end_overlay()
    if not ok then
        active = false
        print('MCP Ped Labels: rendering stopped: ' .. tostring(message))
    end
end

function main()
    load_models()
    font = renderCreateFont('Arial', 9, 5)
    assert(font, 'Could not create overlay font')
    local started = getGameTimer()
    local refreshed = -1000
    active = true
    print('MCP Ped Labels: overlay started for 60 seconds of game time.')
    while getGameTimer() - started < 60000 do
        wait(0)
        local now = getGameTimer()
        if now - refreshed >= 200 then
            refreshed = now
            entries = {}
            for _, ped in ipairs(getAllChars()) do
                if doesCharExist(ped) then
                    local model = getCharModel(ped)
                    local male = isCharMale(ped)
                    local pointer = getCharPointer(ped)
                    entries[#entries + 1] = {
                        ped = ped,
                        pointer = pointer,
                        color = male and 0xFF80DDFF or 0xFFFFA0D0,
                        lines = {
                            'Sexo: ' .. (male and 'masculino' or 'feminino'),
                            string.format('Memoria: 0x%08X', pointer),
                            string.format('Vida: %d', getCharHealth(ped)),
                            string.format('Modelo: %s [%d]', models[model] or 'desconhecido', model)
                        }
                    }
                end
            end
        end
    end
    cleanup()
    print('MCP Ped Labels: 60 seconds elapsed; overlay removed.')
end
