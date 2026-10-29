-- Managed module: run with gta_run_script, timeout_ms >= 45000.
-- Samples five primary task chains every 250 ms; stores a bounded change history.
local ffi, bit = require 'ffi', require 'bit'
ffi.cdef[[
typedef struct MCPWatchRegion {
 void* base; void* allocation; uint32_t allocationProtect;
 size_t size; uint32_t state; uint32_t protect; uint32_t kind;
} MCPWatchRegion;
size_t __stdcall VirtualQuery(const void*, void*, size_t);
uint32_t __stdcall GetTickCount(void);
]]
local region = ffi.new('MCPWatchRegion[1]')
local function accessible(address, size, executable)
    if not address or address < 65536 or address + size > 4294967295 then return false end
    if ffi.C.VirtualQuery(ffi.cast('void*', address), region, 28) == 0 then return false end
    local r = region[0]
    return r.state == 0x1000 and bit.band(r.protect, 0x101) == 0
        and address + size <= tonumber(ffi.cast('uintptr_t', r.base)) + tonumber(r.size)
        and bit.band(r.protect, executable and 0xF0 or 0xEE) ~= 0
end
local function read(address)
    if accessible(address, 4, false) then return tonumber(ffi.cast('uint32_t*', address)[0]) end
end
local methods = {[2] = {}, [4] = {}}
local function method(task, slot)
    local vtable = read(task)
    local code = vtable and read(vtable + slot * 4)
    if not code or not accessible(code, 1, true) then return nil end
    if not methods[slot][code] then
        methods[slot][code] = ffi.cast(slot == 4 and 'int (__thiscall*)(void*)'
            or 'uint32_t (__thiscall*)(void*)', code)
    end
    return tonumber(methods[slot][code](ffi.cast('void*', task)))
end
local function inspect(pointer, names, observed)
    local intelligence = read(pointer + 0x47C)
    assert(intelligence and read(intelligence) == pointer and read(intelligence + 0x30) == pointer,
        'Incompatible CPed task manager layout')
    local tasks = {}
    for slot = 0,4 do
        local task = read(intelligence + 4 + slot * 4)
        if task and task ~= 0 then
            local chain, seen, root = {}, {}, task
            for _ = 1,16 do
                if not task or task == 0 or seen[task] then break end
                seen[task] = true
                local id = method(task, 4)
                if not id or id < 0 or id > 65535 then break end
                chain[#chain + 1] = id
                observed[tostring(id)] = names[tostring(id)] or ('TASK_ID_' .. id)
                task = method(task, 2)
            end
            if #chain > 0 then tasks[#tasks + 1] = {slot = slot, active = #tasks == 0,
                root_address = string.format('0x%08X', root), chain = chain} end
        end
    end
    return tasks
end
return function(ctx)
    assert(ffi.abi('32bit'), 'Requires 32-bit GTA SA 1.0 US')
    local cj = PLAYER_PED
    assert(doesCharExist(cj) and not isCharDead(cj), 'CJ is unavailable')
    local group = getPlayerGroup(PLAYER_HANDLE)
    assert(isGroupLeader(cj, group), 'CJ is not the group leader')
    local root = getWorkingDirectory():gsub('[/\\]moonloader[/\\]?$', '')
    local file = assert(io.open(root .. '/mcp_scripts/mcp_task_names.json', 'r'))
    local names = decodeJson(file:read('*a')).names; file:close()
    requestModel(105); loadAllModelsNow()
    assert(hasModelLoaded(105), 'FAM1 model unavailable')
    local x,y,z = getOffsetFromCharInWorldCoords(cj, 2, 1, 0)
    local ped = createChar(8, 105, x,y,z)
    assert(doesCharExist(ped), 'Ped creation failed')
    local ok, report = xpcall(function()
        setCharInterior(ped, getCharActiveInterior(cj))
        setCharHeading(ped, getCharHeading(cj))
        setGroupMember(group, ped)
        assert(isGroupMember(ped, group), 'Player group is full or recruitment failed')
        local pointer = getCharPointer(ped)
        local started = tonumber(ffi.C.GetTickCount())
        local function elapsed() return (tonumber(ffi.C.GetTickCount()) - started) % 4294967296 end
        local result = {ped = ped, address = string.format('0x%08X', pointer), model = 105,
            group = group, duration_ms = 30000, sample_interval_ms = 250,
            events = {}, task_names = {}, dropped_events = 0, samples = 0,
            note = 'Task changes observed by sampling; brief changes between samples may be missed.'}
        local previous, published = nil, -1000
        printStringNow('~g~MCP: membro Grove recrutado.~n~~w~Monitorando tarefas por 30 segundos.', 6000)
        while true do
            local exists = doesCharExist(ped) and getCharPointer(ped) == pointer
            local dead = exists and isCharDead(ped)
            local member = exists and isGroupMember(ped, group)
            local tasks = exists and not dead and inspect(pointer, names, result.task_names) or {}
            local health = exists and getCharHealth(ped) or 0
            local signature = encodeJson({tasks = tasks, health = health, member = member, dead = dead})
            result.samples = result.samples + 1
            result.elapsed_ms = elapsed()
            result.alive, result.in_group, result.health = exists and not dead, member, health
            if signature ~= previous then
                result.events[#result.events + 1] = {elapsed_ms = result.elapsed_ms,
                    tasks = tasks, health = health, in_group = member, dead = dead}
                previous = signature
                -- Preserve the initial state and the most recent changes within the wire limit.
                while #result.events > 32 or #encodeJson(result) > 14000 do
                    if #result.events <= 1 then error('Monitor summary exceeded result capacity') end
                    table.remove(result.events, 2); result.dropped_events = result.dropped_events + 1
                end
            end
            if not exists then result.reason = 'ped_unavailable'
            elseif dead then result.reason = 'ped_died'
            elseif not member then result.reason = 'left_group'
            elseif result.elapsed_ms >= 30000 then result.reason = 'duration_elapsed' end
            if result.reason then break end
            if result.elapsed_ms - published >= 1000 then
                ctx.publish(result); published = result.elapsed_ms
            end
            wait(250)
        end
        return result
    end, debug.traceback)
    markModelAsNoLongerNeeded(105)
    if doesCharExist(ped) then
        if ok then markCharAsNoLongerNeeded(ped) else deleteChar(ped) end
    end
    if not ok then error(report) end
    return report
end
