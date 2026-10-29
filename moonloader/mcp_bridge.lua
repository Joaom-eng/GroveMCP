--[[ GroveMCP licensing notices

MIT License

Copyright (c) 2026 GroveMCP contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

Linked dependency in McpServer.SA.asi - Plugin-SDK:
Copyright (c) 2013-2014 Dmitry K. <>
Copyright (c) 2013-2014 fastman92 <>
Copyright (c) 2014 LINK/2012 <dma_2012@hotmail.com>

This software is provided 'as-is', without any express or implied
warranty. In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

   1. The origin of this software must not be misrepresented; you must not
   claim that you wrote the original software. If you use this software
   in a product, an acknowledgment in the product documentation would be
   appreciated but is not required.

   2. Altered source versions must be plainly marked as such, and must not be
   misrepresented as being the original software.

   3. This notice may not be removed or altered from any source
   distribution.


]]

script_name('MCP Bridge')
script_author('McpServer project')
script_version('0.3.0')
script_moonloader(26)
script_properties('work-in-pause')
local ffi = require 'ffi'
require('jit').off(true, true)
ffi.cdef[[
typedef struct McpBridgeCommand {
    uint32_t id; uint32_t operation; char path[1024];
    uint32_t timeoutMs; char json[16384];
} McpBridgeCommand;
void* __stdcall GetModuleHandleA(const char*);
void* __stdcall GetProcAddress(void*, const char*);
uint32_t __stdcall GetTickCount(void);
]]
assert(ffi.sizeof('McpBridgeCommand') == 17420)
local executions, reportExecution = {}, nil
local function bind(module, name, ctype)
    return ffi.cast(ctype, assert(ffi.C.GetProcAddress(module, name), 'Missing ASI export: ' .. name))
end
local function now() return tonumber(ffi.C.GetTickCount()) end
local function fail(id, message, kind)
    local json = encodeJson({message = tostring(message):sub(1,2000), kind = kind or 'runner_error'})
    reportExecution(id, 4, -1, json, #json)
end
function onExitScript()
    if not reportExecution then return end
    for id, entry in pairs(executions) do
        fail(id, 'MoonLoader bridge stopped or reloaded', 'worker_stopped')
        pcall(function() entry.script:unload() end)
        os.remove(entry.wrapper)
    end
end
function main()
    local module = assert(ffi.C.GetModuleHandleA('McpServer.SA.asi'), 'ASI is not loaded; restart GTA after installation')
    local version = bind(module, 'McpBridge_GetApiVersion', 'unsigned int (__cdecl*)(void)')
    assert(version() == 3, 'Incompatible ASI API; install matching EXE, ASI and Lua files')
    local poll = bind(module, 'McpBridge_PollCommand', 'int (__cdecl*)(McpBridgeCommand*, unsigned int)')
    local report = bind(module, 'McpBridge_ReportResult', 'int (__cdecl*)(unsigned int, int, int, const char*)')
    reportExecution = bind(module, 'McpBridge_ReportExecution', 'int (__cdecl*)(unsigned int,unsigned int,int,const char*,unsigned int)')
    local directory = getWorkingDirectory() .. '/mcp_runtime'
    createDirectory(directory)
    local runner = getWorkingDirectory() .. '/lib/mcp_runner.lua'
    local command = ffi.new('McpBridgeCommand[1]')
    print('MCP Bridge: v3 ready; managed Lua results enabled.')
    while true do
        wait(50)
        local result = poll(command, ffi.sizeof(command[0]))
        assert(result >= 0, 'MCP Bridge ABI mismatch')
        if result == 1 then
            local c = command[0]
            local id, operation, path = tonumber(c.id), tonumber(c.operation), ffi.string(c.path)
            if operation == 3 then
                local ok, loaded = pcall(script.load, path)
                if ok and loaded ~= nil then
                    report(id, 1, tonumber(loaded.id) or -1, 'MoonLoader accepted script.load; script may continue running')
                else report(id, 0, -1, 'script.load failed; inspect moonloader.log for details') end
            elseif operation == 7 then
                local wrapper = directory .. '/run_' .. id .. '.lua'
                local ok, loaded = pcall(function()
                    local source = string.format('script_name("MCP Run %d")\nscript_properties("work-in-pause")\nassert(loadfile(%q))()(%d,%q,%q,%d)\n',
                        id, runner, id, path, ffi.string(c.json), tonumber(c.timeoutMs))
                    local file = assert(io.open(wrapper, 'wb'))
                    file:write(source); file:close()
                    return assert(script.load(wrapper), 'MoonLoader rejected execution wrapper')
                end)
                if ok then
                    executions[id] = {script = loaded, scriptId = tonumber(loaded.id), wrapper = wrapper, started = now(), timeout = tonumber(c.timeoutMs)}
                    -- Completion may already have arrived. The ASI rejects late running updates.
                    reportExecution(id, 5, tonumber(loaded.id) or -1, 'null', 4)
                else os.remove(wrapper); fail(id, loaded, 'load_error') end
            elseif operation == 9 then
                local entry = executions[id]
                if entry then
                    local ok, err = pcall(function() entry.script:unload() end)
                    if ok then reportExecution(id, 7, -1, 'null', 4)
                    else fail(id, err, 'unload_error') end
                    os.remove(entry.wrapper)
                    executions[id] = nil
                else reportExecution(id, 7, -1, 'null', 4) end
            end
        end
        local live = {}
        for _, instance in ipairs(script.list()) do live[tonumber(instance.id)] = true end
        for id, entry in pairs(executions) do
            if not live[entry.scriptId] then
                fail(id, 'Runner terminated without reporting a result', 'runner_terminated')
                os.remove(entry.wrapper); executions[id] = nil
            elseif (now() - entry.started) % 4294967296 >= entry.timeout then
                fail(id, 'Managed execution exceeded its wall-clock timeout', 'timeout')
                pcall(function() entry.script:unload() end)
                os.remove(entry.wrapper); executions[id] = nil
            end
        end
    end
end
