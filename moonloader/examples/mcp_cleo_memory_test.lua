script_name('MCP CLEO Memory Test')
script_description('Starts a short real CLEO thread to exercise the memory hooks')
local ffi = require 'ffi'
require('jit').off(true, true)
ffi.cdef[[
void* __stdcall GetModuleHandleA(const char*);
void* __stdcall GetProcAddress(void*, const char*);
]]
local function word(n) return string.char(n % 256, math.floor(n / 256) % 256) end
local function integer(n) return string.char(1) .. word(n % 65536) .. word(math.floor(n / 65536)) end
local function variable(n) return string.char(3) .. word(n) end
local function opcode(n, args) return word(n) .. (args or '') end
function main()
    local root = getWorkingDirectory():gsub('[/\\]moonloader[/\\]?$', '')
    local path = root .. '/mcp_scripts/mcp_memory_fixture.cs'
    local wait5 = opcode(0x0001, integer(5000))
    local code = opcode(0x03A4, string.char(9) .. 'MCPMEM01')
        .. opcode(0x0AC8, integer(4096) .. variable(0)) .. wait5
        .. opcode(0x0AC8, integer(8192) .. variable(1)) .. wait5
        .. opcode(0x0AC9, variable(0)) .. wait5
        .. opcode(0x0AC9, variable(1)) .. opcode(0x0A93)
    local file = assert(io.open(path, 'wb'))
    file:write(code); file:close()
    local module = assert(ffi.C.GetModuleHandleA('CLEO.asi'))
    local address = assert(ffi.C.GetProcAddress(module, '_CLEO_CreateCustomScript@12'))
    local create = ffi.cast('void* (__stdcall*)(void*, const char*, int)', address)
    local thread = create(nil, path, 0)
    assert(thread ~= nil, 'CLEO did not create the test thread')
    print(string.format('Real CLEO fixture started at 0x%08X; expected 4096 -> 12288 -> 8192 -> 0 bytes over 15 seconds.',
        tonumber(ffi.cast('uintptr_t', thread))))
end
