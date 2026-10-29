script_name('MCP CLEO Scripts')
script_author('McpServer project')
script_description('Read-only live CLEO 4.4.4 script queue listing for GTA SA 1.0 US.')

local ffi = require 'ffi'
local imgui = require 'imgui'
local bit = require 'bit'
assert(ffi.abi('32bit'), 'Requires 32-bit GTA SA')
ffi.cdef[[
typedef struct MCPCleoThread {
    uint32_t next;
    uint32_t previous;
    char name[8];
    uint32_t base_ip;
    uint32_t current_ip;
    uint8_t padding_18_c4[172];
    uint8_t active;
    uint8_t padding_c5_cc[7];
    uint32_t wake_time;
    uint8_t padding_d0_df[15];
    uint8_t is_custom;
} MCPCleoThread;
typedef struct MCPCleoRegion {
    void* base;
    void* allocation_base;
    uint32_t allocation_protect;
    size_t size;
    uint32_t state;
    uint32_t protect;
    uint32_t type;
} MCPCleoRegion;
size_t __stdcall VirtualQuery(const void*, void*, size_t);
void* __stdcall GetModuleHandleA(const char*);
void* __stdcall GetProcAddress(void*, const char*);
]]
assert(ffi.sizeof('MCPCleoThread') == 0xE0)
assert(ffi.offsetof('MCPCleoThread', 'active') == 0xC4)
assert(ffi.offsetof('MCPCleoThread', 'wake_time') == 0xCC)
assert(ffi.offsetof('MCPCleoThread', 'is_custom') == 0xDF)

local region = ffi.new('MCPCleoRegion[1]')
local function readable(address, size)
    if not address or address < 65536 or address + size > 4294967295 then return false end
    if ffi.C.VirtualQuery(ffi.cast('const void*', address), region, ffi.sizeof(region[0])) == 0 then return false end
    local r = region[0]
    return r.state == 0x1000 and bit.band(r.protect, 0x101) == 0 and bit.band(r.protect, 0xEE) ~= 0
        and address + size <= tonumber(ffi.cast('uintptr_t', r.base)) + tonumber(r.size)
end

local rows = {}
local root
local started
local active = false
local count_all = 0
local scan_error
local previous_signature
local PAGE_SIZE = 22

imgui.ShowCursor = false
imgui.LockPlayer = false
imgui.DisableInput = true
imgui.RenderInMenu = false
local flags = bit.bor(imgui.WindowFlags.NoTitleBar, imgui.WindowFlags.NoResize,
    imgui.WindowFlags.NoMove, imgui.WindowFlags.AlwaysAutoResize,
    imgui.WindowFlags.NoSavedSettings, imgui.WindowFlags.NoInputs,
    imgui.WindowFlags.NoFocusOnAppearing)

local function scan()
    -- CTheScripts::pActiveScripts, confirmed by the installed Plugin-SDK.
    assert(readable(0xA8B42C, 4), 'Active script queue pointer is unreadable')
    local address = tonumber(ffi.cast('const uint32_t*', 0xA8B42C)[0])
    local seen, updated = {}, {}
    local now = getGameTimer()
    local total = 0
    scan_error = nil
    for _ = 1, 4096 do
        if address == 0 then break end
        if seen[address] or not readable(address, 0xE0) then
            scan_error = 'Queue traversal interrupted: invalid or repeated pointer'
            break
        end
        seen[address] = true
        total = total + 1
        local thread = ffi.cast('const MCPCleoThread*', address)[0]
        if thread.is_custom == 1 and thread.active ~= 0 then
            local name = ffi.string(thread.name, 8):match('^[^%z]*')
            -- ImGui expects UTF-8. Thread identifiers are normally ASCII;
            -- replace control/non-ASCII bytes instead of sending invalid text.
            name = name:gsub('[^ -~]', '?')
            local wake = tonumber(thread.wake_time)
            updated[#updated + 1] = {
                name = name ~= '' and name or '(sem nome)',
                address = string.format('0x%08X', address),
                pointer = address,
                instruction_pointer = string.format('0x%08X', tonumber(thread.current_ip)),
                state = wake > now and 'WAIT' or 'PRONTO',
                wait_remaining_ms = math.max(0, wake - now)
            }
        end
        address = tonumber(thread.next)
    end
    if total == 4096 and address ~= 0 then scan_error = 'Queue traversal reached its safety limit' end
    table.sort(updated, function(a, b)
        if a.name == b.name then return a.pointer < b.pointer end
        return a.name:lower() < b.name:lower()
    end)
    rows = updated
    count_all = total
    local signature = ''
    for _, row in ipairs(rows) do signature = signature .. row.address .. ';' end
    if signature ~= previous_signature then
        local file = io.open(root .. '/mcp_scripts/cleo_active_scripts.json', 'w')
        if file then
            file:write(encodeJson({cleo_version = '4.4.4', game_time_ms = now,
                count = #rows, total_script_threads = count_all, scripts = rows,
                scan_error = scan_error,
                note = 'Live active CLEO threads; names are internal identifiers, not guaranteed filenames. WAIT threads remain active.'}))
            file:close()
        end
        print('MCP CLEO Scripts: ' .. #rows .. ' active CLEO threads out of ' .. total .. ' game script threads.')
        previous_signature = signature
    end
end

function imgui.OnDrawFrame()
    if not active then return end
    local pages = math.max(1, math.ceil(#rows / PAGE_SIZE))
    local page = math.floor((getGameTimer() - started) / 8000) % pages
    imgui.SetNextWindowPos(imgui.ImVec2(25, 45), imgui.Cond.Always)
    imgui.PushStyleColor(imgui.Col.WindowBg, imgui.ImVec4(0.02, 0.02, 0.02, 0.85))
    imgui.Begin('##mcp_cleo_scripts', nil, flags)
    imgui.TextColored(imgui.ImVec4(0.55, 1, 0.65, 1), 'CLEO 4.4.4: scripts ativos em memoria')
    imgui.Text(string.format('%d threads CLEO | pagina %d/%d (troca a cada 8s)', #rows, page + 1, pages))
    imgui.Text('Nome interno | endereco | estado')
    imgui.Separator()
    for index = page * PAGE_SIZE + 1, math.min(#rows, (page + 1) * PAGE_SIZE) do
        local row = rows[index]
        imgui.Text(string.format('%-8s | %s | %s', row.name, row.address, row.state))
    end
    if #rows == 0 then imgui.Text('Nenhuma thread CLEO ativa encontrada.') end
    if scan_error then imgui.Text(scan_error) end
    imgui.Separator()
    imgui.Text('WAIT = carregado, aguardando o temporizador do script.')
    imgui.End()
    imgui.PopStyleColor()
end

function onExitScript() active = false; imgui.Process = false end

function main()
    local module = ffi.C.GetModuleHandleA('CLEO.asi')
    assert(module ~= nil, 'CLEO.asi is not loaded')
    local version_ptr = ffi.C.GetProcAddress(module, '_CLEO_GetVersion@0')
    local game_ptr = ffi.C.GetProcAddress(module, '_CLEO_GetGameVersion@0')
    assert(version_ptr ~= nil and game_ptr ~= nil, 'CLEO version exports unavailable')
    local version = tonumber(ffi.cast('uint32_t (__stdcall*)(void)', version_ptr)())
    local game = tonumber(ffi.cast('int (__stdcall*)(void)', game_ptr)())
    assert(version == 0x04040400 and game == 0, 'This verified layout requires CLEO 4.4.4 and GTA SA 1.0 US')
    root = getWorkingDirectory():gsub('[/\\]moonloader[/\\]?$', '')
    started = getGameTimer()
    active = true
    imgui.Process = true
    while getGameTimer() - started < 60000 do
        scan()
        wait(500)
    end
    active = false
    imgui.Process = false
    print('MCP CLEO Scripts: 60 seconds elapsed; list closed.')
end
