-- Run with the 32-bit LuaJIT shipped with MoonLoader. Only game/ABI boundaries
-- are mocked; execute the actual runner, including xpcall and coroutine yields.
local runnerPath = arg[1] or 'McpServer/moonloader/lib/mcp_runner.lua'
local realLoadfile = loadfile
local clock, reports, encoded, counter, terminal = 0, {}, {}, 0, false
local fixtures = {}
package.loaded.ffi = {
    cdef = function() end,
    C = {
        GetTickCount = function() clock = clock + 1; return clock end,
        GetModuleHandleA = function() return true end,
        GetProcAddress = function() return true end
    },
    cast = function()
        return function(id, state, scriptId, json, length)
            assert(id == 1 and scriptId == 42 and length == #json)
            if terminal then return 0 end
            reports[#reports + 1] = {state = state, value = encoded[json]}
            terminal = state ~= 5
            return 1
        end
    end
}
function thisScript() return {id = 42} end
function decodeJson() return {answer = 42} end
function encodeJson(value)
    assert(type(value) ~= 'function', 'unsupported JSON value')
    counter = counter + 1
    local key = type(value) == 'string' and value or ('payload_' .. counter)
    encoded[key] = value
    return key
end
function wait(ms) return coroutine.yield(ms) end
loadfile = function(path) return fixtures[path] or realLoadfile(path) end
local function start(chunk, timeout)
    clock, reports, encoded, counter, terminal = 0, {}, {}, 0, false
    fixtures.target = chunk
    assert(realLoadfile(runnerPath))()(1, 'target', '{}', timeout or 1000)
    local thread = coroutine.create(main)
    local ok, err = coroutine.resume(thread)
    assert(ok, err)
    return thread
end
start(function() return function(ctx) return {answer = ctx.params.answer} end end)
assert(reports[1].state == 6 and reports[1].value.answer == 42)
start(function() return function() error('intentional failure') end end)
assert(reports[1].state == 4 and reports[1].value.message:find('intentional failure'))
assert(reports[1].value.traceback:find('stack traceback'))
start(function() return false end)
assert(reports[1].state == 4 and reports[1].value.message:find('return function'))
local thread = start(function() return function(ctx)
    ctx.publish({phase = 'waiting'}); wait(1); return {done = true}
end end)
assert(reports[1].state == 5 and reports[1].value.phase == 'waiting')
assert(coroutine.resume(thread))
assert(reports[2].state == 6 and reports[2].value.done)
start(function() return function() return nil end end)
assert(reports[1].state == 6 and reports[1].value == nil)
start(function() return function() return string.rep('x', 17000) end end)
assert(reports[1].state == 4 and reports[1].value.kind == 'result_error')
start(function() return function() return function() end end end)
assert(reports[1].state == 4 and reports[1].value.kind == 'result_error')
start(function() return function() while true do end end end, 100)
assert(reports[1].state == 4 and reports[1].value.kind == 'timeout')
thread = start(function() return function() wait(1000) end end)
onExitScript()
assert(reports[1].state == 7)
print('PASS: managed results, parameters, traceback, module format, progress across wait, null, serialization/size errors, Lua-loop timeout and exit cancellation.')
