script_name('MCP CLEO Memory')
script_author('McpServer project')
script_description('LuaJIT hooks for CLEO 4.4.4 ALLOCATE_MEMORY / FREE_MEMORY')
script_properties('work-in-pause')

-- Verified against SHA256 748EA0B36A1580652146C8B443066BDD81EF14556431805B2102F0F1F44CAA08.
-- These RVAs belong to this CLEO build, not arbitrary CLEO 4 releases.
-- Original handlers run exactly once. No detour library or ASI changes required.
local ffi, bit, imgui = require 'ffi', require 'bit', require 'imgui'
require('jit').off(true, true) -- FFI -> native -> Lua callback reentry must remain interpreted.
ffi.cdef[[
void* __stdcall GetModuleHandleA(const char*);
void* __stdcall GetProcAddress(void*, const char*);
int __stdcall VirtualProtect(void*, size_t, uint32_t, uint32_t*);
typedef uint8_t (__stdcall *MCPMemoryHandler)(void*);
typedef uint32_t (__stdcall *MCPMemoryReadInt)(void*);
typedef uint32_t* (__stdcall *MCPMemoryReadOutput)(void*);
]]
local root, slots, originals, callbacks, params
local readInt, readOutput
local installed = false
local blocks, owners, currentOwners, events = {}, {}, {}, {}
local sequence, generation, callbackErrors, unknownFrees = 0, 0, 0, 0
local selfTest, failure, started, stopped
local currentBytes, peakBytes, countBlocks = 0, 0, 0
local function ptr(p) return tonumber(ffi.cast('uintptr_t', p)) end
local function u32(p, offset) return ffi.cast('uint32_t*', ffi.cast('uint8_t*', p) + offset) end
local function hex(n) return string.format('0x%08X', n) end

local function writeSlots(a, b)
    local old, discard = ffi.new('uint32_t[1]'), ffi.new('uint32_t[1]')
    assert(ffi.C.VirtualProtect(slots, 8, 4, old) ~= 0, 'Cannot make handler slots writable')
    slots[0], slots[1] = a, b
    assert(ffi.C.VirtualProtect(slots, 8, old[0], discard) ~= 0, 'Cannot restore table protection')
end

local function ownerFor(thread)
    local address, base = ptr(thread), tonumber(u32(thread, 0x10)[0])
    local name = ffi.string(ffi.cast('char*', thread) + 8, 8):match('^[^%z]*'):gsub('[^ -~]', '?')
    local owner = currentOwners[address]
    if not owner or owner.base ~= base or owner.name ~= name then
        generation = generation + 1
        owner = {id = generation, thread = hex(address), base = base, name = name,
            bytes = 0, peak_bytes = 0, blocks = 0, allocations = 0, frees = 0}
        owners[#owners + 1] = owner
        currentOwners[address] = owner
    end
    return owner
end

local function event(kind, thread, address, size, owner)
    sequence = sequence + 1
    events[#events + 1] = {sequence = sequence, kind = kind, address = hex(address),
        bytes = size, owner_id = owner and owner.id, executing_thread = hex(ptr(thread)),
        game_time_ms = getGameTimer()}
    if #events > 256 then table.remove(events, 1) end
end

local function allocated(thread, address, size)
    if address == 0 then event('allocation_failed', thread, 0, size); return end
    -- A repeated pointer means an unobserved free occurred outside opcode 0AC9.
    -- Do not silently double-count it.
    if blocks[address] then error('Pointer reused without an observed FREE_MEMORY: ' .. hex(address)) end
    local owner = ownerFor(thread)
    blocks[address] = {bytes = size, owner = owner}
    owner.bytes, owner.blocks = owner.bytes + size, owner.blocks + 1
    owner.allocations = owner.allocations + 1
    owner.peak_bytes = math.max(owner.peak_bytes, owner.bytes)
    currentBytes, countBlocks = currentBytes + size, countBlocks + 1
    peakBytes = math.max(peakBytes, currentBytes)
    event('allocate', thread, address, size, owner)
end

local function freed(thread, address)
    local block = blocks[address]
    if not block then unknownFrees = unknownFrees + 1; return end
    local owner = block.owner -- A different script can free the original owner's block.
    owner.bytes, owner.blocks = owner.bytes - block.bytes, owner.blocks - 1
    owner.frees = owner.frees + 1
    currentBytes, countBlocks = currentBytes - block.bytes, countBlocks - 1
    blocks[address] = nil
    event('free', thread, address, block.bytes, owner)
end

-- CLEO's parameter reader uses current IP and shared opcodeParams[0]. Save both
-- around the inspection. The original handler subsequently decodes them normally.
local function peek(thread, output)
    local ip, saved = u32(thread, 0x14), params[0]
    local oldIP = ip[0]
    local ok, value, destination = pcall(function()
        local value = tonumber(readInt(thread))
        return value, output and readOutput(thread) or nil
    end)
    ip[0], params[0] = oldIP, saved
    return ok, value, destination
end

local function observationError(message)
    callbackErrors = callbackErrors + 1
    failure = tostring(message)
end

local function install()
    assert(ffi.abi('32bit'), 'Requires 32-bit MoonLoader')
    local module = ffi.C.GetModuleHandleA('CLEO.asi')
    assert(module ~= nil, 'CLEO.asi is not loaded')
    local function exported(name, signature)
        local address = ffi.C.GetProcAddress(module, name)
        assert(address ~= nil, 'Missing CLEO export: ' .. name)
        return ffi.cast(signature, address)
    end
    assert(exported('_CLEO_GetVersion@0', 'uint32_t (__stdcall*)(void)')() == 0x04040400,
        'Requires the verified CLEO 4.4.4 build')
    assert(exported('_CLEO_GetGameVersion@0', 'int (__stdcall*)(void)')() == 0, 'Requires GTA SA 1.0 US')
    local base = ptr(module)
    slots = ffi.cast('uint32_t*', base + 0x45760)
    assert(tonumber(slots[0]) == base + 0x60F0 and tonumber(slots[1]) == base + 0x6180,
        'Handler table differs or another hook already owns these slots')
    assert(ffi.string(ffi.cast('char*', base + 0x60F0), 9) == string.char(0x55,0x8B,0xEC,0x83,0xE4,0xF8,0x83,0xEC,0x10),
        'ALLOCATE_MEMORY handler signature differs')
    assert(ffi.string(ffi.cast('char*', base + 0x6180), 12) == string.char(0x55,0x8B,0xEC,0x83,0xEC,0x0C,0x8B,0x4D,0x08,0x56,0x6A,0x01),
        'FREE_MEMORY handler signature differs')
    params = ffi.cast('uint32_t**', base + 0x70E54)[0]
    assert(params ~= nil, 'CLEO opcode parameter buffer unavailable')
    readInt = exported('_CLEO_GetIntOpcodeParam@4', 'MCPMemoryReadInt')
    readOutput = exported('_CLEO_GetPointerToScriptVariable@4', 'MCPMemoryReadOutput')
    originals = {ffi.cast('MCPMemoryHandler', slots[0]), ffi.cast('MCPMemoryHandler', slots[1])}
    callbacks = {
        ffi.cast('MCPMemoryHandler', function(thread)
            local ok, size, output = peek(thread, true)
            local result = originals[1](thread)
            if ok and output ~= nil then
                local recorded, err = pcall(allocated, thread, tonumber(output[0]), size)
                if not recorded then observationError(err) end
            else observationError(size) end
            return result
        end),
        ffi.cast('MCPMemoryHandler', function(thread)
            local ok, address = peek(thread, false)
            local result = originals[2](thread)
            if ok then
                local recorded, err = pcall(freed, thread, address)
                if not recorded then observationError(err) end
            else observationError(address) end
            return result
        end)
    }
    -- Set before writing: exit cleanup also works if protection restoration fails.
    installed = true
    writeSlots(ptr(callbacks[1]), ptr(callbacks[2]))
end

local function uninstall()
    if not installed then return end
    assert(tonumber(slots[0]) == ptr(callbacks[1]) and tonumber(slots[1]) == ptr(callbacks[2]),
        'Handler ownership changed; refusing to overwrite another hook')
    writeSlots(ptr(originals[1]), ptr(originals[2]))
    installed, stopped = false, true
    -- Keep callbacks rooted until the Lua state closes; never free a live callback.
end

local function runSelfTest()
    -- Real CLEO handlers with a private CRunningScript-sized fixture, not a live
    -- game's thread. Local variable 0 receives the pointer. Both opcode calls
    -- go through the installed table, including the real malloc/free path.
    local thread = ffi.new('uint8_t[224]')
    ffi.copy(thread + 8, 'MCPTEST', 7)
    thread[0xDF] = 1
    local cases = {
        {size = 4096, bytes = string.char(1,0,16,0,0,3,0,0)},
        {size = 64, bytes = string.char(4,64,3,0,0)},
        {size = 1024, bytes = string.char(5,0,4,3,0,0)},
        {size = 2048, bytes = string.char(3,1,0,3,0,0), local_size = 2048}
    }
    local results, previousParam = {}, params[0]
    for _, case in ipairs(cases) do
        local code = ffi.new('uint8_t[?]', #case.bytes)
        ffi.copy(code, case.bytes, #case.bytes)
        u32(thread, 0x10)[0], u32(thread, 0x14)[0] = ptr(code), ptr(code)
        u32(thread, 0x40)[0] = case.local_size or 0
        local before = currentBytes
        local result = ffi.cast('MCPMemoryHandler', slots[0])(thread)
        local address = tonumber(u32(thread, 0x3C)[0])
        local observed = blocks[address]
        local allocatedOK = result == 0 and observed and observed.bytes == case.size
            and currentBytes == before + case.size and thread[0xC5] ~= 0
            and tonumber(u32(thread, 0x14)[0]) == ptr(code) + #case.bytes
        local freeCode = ffi.new('uint8_t[3]', {3,0,0})
        u32(thread, 0x14)[0] = ptr(freeCode)
        local freeResult = ffi.cast('MCPMemoryHandler', slots[1])(thread)
        assert(allocatedOK and freeResult == 0 and blocks[address] == nil and currentBytes == before
            and tonumber(u32(thread, 0x14)[0]) == ptr(freeCode) + 3, 'Native hook self-test failed')
        results[#results + 1] = {bytes = case.size, address = hex(address), passed = true}
    end
    params[0] = previousParam
    -- Test data is kept separately from actual scripts' statistics.
    blocks, owners, currentOwners, events = {}, {}, {}, {}
    currentBytes, peakBytes, countBlocks, sequence, generation = 0,0,0,0,0
    return {passed = true, cases = results, checks = 'Real handlers, four parameter encodings, output, condition, IP and free'}
end

local function snapshot()
    local allocations = {}
    for address, block in pairs(blocks) do
        allocations[#allocations + 1] = {address = hex(address), bytes = block.bytes, owner_id = block.owner.id}
    end
    local file = assert(io.open(root .. '/mcp_scripts/cleo_memory_snapshot.json', 'w'))
    file:write(encodeJson({installed = installed, stopped = stopped or false, started_game_time_ms = started,
        current_bytes = currentBytes, peak_bytes = peakBytes, blocks = countBlocks,
        owners = owners, allocations = allocations, recent_events = events, self_test = selfTest,
        callback_errors = callbackErrors, last_error = failure, untracked_free_calls = unknownFrees,
        scope = 'Only 0AC8/0AC9 observed since installation; excludes earlier allocations, allocator overhead and frees outside 0AC9.'}))
    file:close()
end

imgui.ShowCursor, imgui.LockPlayer, imgui.DisableInput, imgui.RenderInMenu = false, false, true, false
local flags = bit.bor(imgui.WindowFlags.NoResize, imgui.WindowFlags.NoMove,
    imgui.WindowFlags.AlwaysAutoResize, imgui.WindowFlags.NoSavedSettings,
    imgui.WindowFlags.NoInputs, imgui.WindowFlags.NoFocusOnAppearing)
function imgui.OnDrawFrame()
    if not installed then return end
    imgui.SetNextWindowPos(imgui.ImVec2(25,45), imgui.Cond.Always)
    imgui.Begin('CLEO: memoria por script##mcp_memory', nil, flags)
    imgui.Text(string.format('Observado: %d bytes | %d blocos | pico: %d bytes', currentBytes, countBlocks, peakBytes))
    imgui.Text('0AC8 / 0AC9 | rastreamento iniciado nesta sessao')
    imgui.Separator()
    local sorted = {}
    for _, owner in ipairs(owners) do sorted[#sorted + 1] = owner end
    table.sort(sorted, function(a,b) return a.bytes > b.bytes end)
    for i = 1, math.min(18, #sorted) do
        local o = sorted[i]
        imgui.Text(string.format('%s #%d | %s | %d B | %d blocos | pico %d B', o.name, o.id, o.thread, o.bytes, o.blocks, o.peak_bytes))
    end
    if #sorted == 0 then imgui.Text('Aguardando novas alocacoes dos scripts CLEO...') end
    if #sorted > 18 then imgui.Text('Demais scripts no snapshot JSON.') end
    imgui.Separator()
    imgui.Text('Alocacoes anteriores e frees fora de 0AC9 nao sao contabilizados.')
    imgui.Text(selfTest and 'Autoteste nativo: 4/4 OK' or 'Autoteste pendente')
    if callbackErrors > 0 then imgui.Text('Erros de observacao: ' .. callbackErrors) end
    imgui.End()
end

function onExitScript()
    imgui.Process = false
    local ok, err = pcall(uninstall)
    if not ok then print('MCP memory cleanup ERROR: ' .. tostring(err)) end
    if root then pcall(snapshot) end
end

function main()
    root = getWorkingDirectory():gsub('[/\\]moonloader[/\\]?$', '')
    local stopPath = root .. '/mcp_scripts/cleo_memory.stop'
    os.remove(stopPath)
    started = getGameTimer()
    install()
    selfTest = runSelfTest()
    snapshot()
    imgui.Process = true
    print('MCP CLEO Memory: hooks installed in Lua; native self-test 4/4 passed.')
    while true do
        wait(500)
        local stop = io.open(stopPath, 'r')
        if stop then stop:close(); os.remove(stopPath); break end
        -- Forget departed thread identities, retain their outstanding blocks.
        local live, address = {}, tonumber(ffi.cast('uint32_t*', 0xA8B42C)[0])
        for _ = 1,4096 do
            if address == 0 or live[address] then break end
            live[address] = true
            address = tonumber(ffi.cast('uint32_t*', address)[0])
        end
        for thread in pairs(currentOwners) do if not live[thread] then currentOwners[thread] = nil end end
        snapshot()
    end
    uninstall()
    imgui.Process = false
    snapshot()
    print('MCP CLEO Memory: original handlers restored; tracking stopped.')
end
