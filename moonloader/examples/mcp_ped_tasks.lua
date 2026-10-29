script_name('MCP Ped Tasks')
script_author('McpServer project')
script_description('Read-only primary task inspector for GTA SA 1.0 US, 60 seconds.')

local imgui = require 'imgui'
local ffi = require 'ffi'
local bit = require 'bit'
assert(ffi.abi('32bit'), 'This task layout requires the 32-bit GTA SA executable')

ffi.cdef[[
typedef struct MCPTaskMemoryInfo {
    void* BaseAddress;
    void* AllocationBase;
    unsigned long AllocationProtect;
    size_t RegionSize;
    unsigned long State;
    unsigned long Protect;
    unsigned long Type;
} MCPTaskMemoryInfo;
size_t __stdcall VirtualQuery(const void* address, void* output, size_t length);
]]
assert(ffi.sizeof('MCPTaskMemoryInfo') == 28)

local info = ffi.new('MCPTaskMemoryInfo[1]')
local function accessible(address, bytes, executable)
    if not address or address < 65536 or address + bytes > 4294967295 then return false end
    if ffi.C.VirtualQuery(ffi.cast('const void*', address), info, ffi.sizeof(info[0])) == 0 then return false end
    local region = info[0]
    if region.State ~= 0x1000 or bit.band(region.Protect, 0x101) ~= 0 then return false end
    if address + bytes > tonumber(ffi.cast('uintptr_t', region.BaseAddress)) + tonumber(region.RegionSize) then return false end
    return bit.band(region.Protect, executable and 0xF0 or 0xEE) ~= 0
end

local function read_u32(address)
    if not accessible(address, 4, false) then return nil end
    return tonumber(ffi.cast('const uint32_t*', address)[0])
end

local methods = {[2] = {}, [4] = {}}
local function task_method(task, slot)
    local vtable = read_u32(task)
    if not vtable or vtable == 0 then return nil end
    local code = read_u32(vtable + slot * 4)
    if not code or not accessible(code, 1, true) then return nil end
    local fn = methods[slot][code]
    if not fn then
        local signature = slot == 4 and 'int (__thiscall*)(void*)' or 'uint32_t (__thiscall*)(void*)'
        fn = ffi.cast(signature, code)
        methods[slot][code] = fn
    end
    return tonumber(fn(ffi.cast('void*', task)))
end

local root
local names
local active = false
local entries = {}
local reported = false
local FADE_START = 5.0
local FADE_END = 60.0
local slots = {'FISICA', 'EVENTO TEMP', 'EVENTO', 'PRINCIPAL', 'PADRAO'}

imgui.ShowCursor = false
imgui.LockPlayer = false
imgui.DisableInput = true
imgui.RenderInMenu = false
local flags = bit.bor(imgui.WindowFlags.NoTitleBar, imgui.WindowFlags.NoResize,
    imgui.WindowFlags.NoMove, imgui.WindowFlags.NoScrollbar,
    imgui.WindowFlags.AlwaysAutoResize, imgui.WindowFlags.NoSavedSettings,
    imgui.WindowFlags.NoInputs, imgui.WindowFlags.NoFocusOnAppearing)

local function task_name(id)
    if not id then return 'indisponivel' end
    return ((names[tostring(id)] or ('TASK_ID_' .. id)):gsub('^TASK_', '')) .. ' [' .. id .. ']'
end

local function task_chain(task)
    local chain, seen = {}, {}
    for _ = 1, 16 do
        if not task or task == 0 or seen[task] then break end
        seen[task] = true
        local id = task_method(task, 4) -- CTask::GetId, verified in Plugin-SDK CTask.cpp.
        if not id or id < 0 or id > 65535 then break end
        chain[#chain + 1] = task_name(id)
        task = task_method(task, 2) -- CTask::GetSubTask, a read-only virtual getter.
    end
    return chain
end

local function inspect(ped)
    local pointer = getCharPointer(ped)
    -- These offsets were checked using static_assert against installed SDK headers.
    local intelligence = read_u32(pointer + 0x47C)
    if not intelligence or intelligence == 0 then return nil end
    local manager = intelligence + 4
    if read_u32(intelligence) ~= pointer or read_u32(manager + 0x2C) ~= pointer then
        return nil -- Skip incompatible/corrupt layouts rather than dereferencing them.
    end
    local lines = {string.format('Ped %d | modelo %d | 0x%08X', ped, getCharModel(ped), pointer)}
    local first = true
    local detail = {}
    for slot = 0, 4 do
        local task = read_u32(manager + slot * 4)
        if task and task ~= 0 then
            local chain = task_chain(task)
            if #chain > 0 then
                local marker = first and '* ' or '  '
                lines[#lines + 1] = marker .. slots[slot + 1] .. ': ' .. chain[1]
                if #chain > 1 then lines[#lines + 1] = '    -> ' .. chain[#chain] end
                detail[#detail + 1] = {slot = slots[slot + 1], active = first, chain = chain}
                first = false
            end
        end
    end
    if first then lines[#lines + 1] = 'Sem tarefa principal legivel' end
    return {ped = ped, pointer = pointer, text = table.concat(lines, '\n'), tasks = detail}
end

function imgui.OnDrawFrame()
    if not active or isPauseMenuActive() or not doesCharExist(PLAYER_PED) then return end
    local px, py, pz = getCharCoordinates(PLAYER_PED)
    local baseAlpha = imgui.GetStyle().Alpha
    local drawn = 0
    imgui.PushStyleColor(imgui.Col.WindowBg, imgui.ImVec4(0.02, 0.02, 0.02, 0.76))
    for _, entry in ipairs(entries) do
        if doesCharExist(entry.ped) and getCharPointer(entry.ped) == entry.pointer then
            local x, y, z = getCharCoordinates(entry.ped)
            local distance = math.sqrt((x-px)^2 + (y-py)^2 + (z-pz)^2)
            local opacity = math.max(0, math.min(1, (FADE_END - distance) / (FADE_END - FADE_START)))
            if opacity > 0 and isPointOnScreen(x, y, z, 0.5) then
                local sx, sy = convert3DCoordsToScreen(x, y, z + 1.2)
                if sx == sx and sy == sy then
                    imgui.SetNextWindowPos(imgui.ImVec2(sx, sy), imgui.Cond.Always, imgui.ImVec2(0.5, 1))
                    imgui.PushStyleVar(imgui.StyleVar.Alpha, baseAlpha * opacity)
                    imgui.Begin('##mcp_tasks_' .. entry.ped, nil, flags)
                    imgui.SetWindowFontScale(0.8)
                    imgui.TextColored(imgui.ImVec4(0.8, 1, 0.65, 1), entry.text)
                    imgui.End()
                    imgui.PopStyleVar()
                    drawn = drawn + 1
                end
            end
        end
    end
    imgui.PopStyleColor()
    if drawn > 0 and not reported then
        print('MCP Ped Tasks: rendered task panels for ' .. drawn .. ' visible peds.')
        reported = true
    end
end

function onExitScript() active = false; imgui.Process = false end

function main()
    root = getWorkingDirectory():gsub('[/\\]moonloader[/\\]?$', '')
    local file = assert(io.open(root .. '/mcp_scripts/mcp_task_names.json', 'r'))
    names = decodeJson(file:read('*a')).names
    file:close()
    local started = getGameTimer()
    local snapshot = false
    active = true
    imgui.Process = true
    print('MCP Ped Tasks: started; * marks the active primary slot, arrow shows its current leaf task.')
    while getGameTimer() - started < 60000 do
        local updated = {}
        for _, ped in ipairs(getAllChars()) do
            if doesCharExist(ped) then
                local entry = inspect(ped)
                if entry then updated[#updated + 1] = entry end
            end
        end
        entries = updated
        if not snapshot and #entries > 0 then
            local summaries = {}
            for _, entry in ipairs(entries) do
                summaries[#summaries + 1] = {ped = entry.ped, pointer = entry.pointer, tasks = entry.tasks}
            end
            local output = io.open(root .. '/mcp_scripts/ped_tasks_snapshot.json', 'w')
            if output then output:write(encodeJson(summaries)); output:close() end
            print('MCP Ped Tasks: inspected ' .. #entries .. ' peds; initial task snapshot written.')
            snapshot = true
        end
        wait(200)
    end
    active = false
    imgui.Process = false
    print('MCP Ped Tasks: 60 seconds elapsed; overlay removed.')
end
