-- Loaded from lib by per-command wrappers. Targets return function(ctx).
-- Each run owns a separate MoonLoader Lua state. This is not a security sandbox.
return function(id, path, encodedParams, timeoutMs)
    local ffi = require 'ffi'
    require('jit').off() -- Disable JIT for this isolated state, including newly loaded target functions.
    ffi.cdef[[
    void* __stdcall GetModuleHandleA(const char*);
    void* __stdcall GetProcAddress(void*, const char*);
    uint32_t __stdcall GetTickCount(void);
    ]]
    local module = assert(ffi.C.GetModuleHandleA('McpServer.SA.asi'))
    local export = assert(ffi.C.GetProcAddress(module, 'McpBridge_ReportExecution'))
    local report = ffi.cast('int (__cdecl*)(unsigned int,unsigned int,int,const char*,unsigned int)', export)
    local finished = false
    local started = tonumber(ffi.C.GetTickCount())
    local function elapsed() return (tonumber(ffi.C.GetTickCount()) - started) % 4294967296 end
    local function send(state, value)
        local json = value == nil and 'null' or encodeJson(value)
        assert(type(json) == 'string', 'Result cannot be encoded as JSON')
        assert(#json < 16384, 'JSON result exceeds 16383 bytes; publish a smaller summary')
        assert(report(id, state, thisScript().id, json, #json) == 1, 'Execution no longer accepts updates')
    end
    local function failure(err)
        debug.sethook()
        return {kind = elapsed() >= timeoutMs and 'timeout' or 'lua_error',
            message = tostring(err):sub(1,1000), traceback = debug.traceback('',2):sub(1,2000)}
    end
    function onExitScript()
        if not finished then report(id, 7, thisScript().id, 'null', 4) end
    end
    function main()
        local ok, value = xpcall(function()
            local ctx = {command_id = id, params = decodeJson(encodedParams)}
            function ctx.publish(data) send(5, data) end
            function ctx.check_timeout()
                if elapsed() >= timeoutMs then error('Managed execution timeout', 2) end
            end
            -- Bound Lua loops too. Blocking native/FFI calls cannot be preempted.
            debug.sethook(ctx.check_timeout, '', 10000)
            local chunk = assert(loadfile(path))
            local run = chunk()
            assert(type(run) == 'function', 'Managed script must return function(ctx); use gta_load_script for normal MoonLoader scripts')
            ctx.check_timeout()
            local result = run(ctx)
            ctx.check_timeout()
            return result
        end, failure)
        debug.sethook()
        if ok then
            local encoded, err = pcall(send, 6, value)
            if not encoded then pcall(send, 4, {kind = 'result_error', message = tostring(err):sub(1,1000)}) end
        else pcall(send, 4, value) end
        finished = true
    end
end
