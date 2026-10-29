-- Read-only fixture for exercising managed execution over the real MCP bridge.
return function(ctx)
    local mode = ctx.params.mode or 'success'
    if mode == 'error' then error('MCP intentional Lua error') end
    if mode == 'yield_error' then wait(25); error('MCP intentional Lua error after wait') end
    if mode == 'oversized' then return string.rep('x', 17000) end
    if mode == 'null' then return nil end
    if mode == 'loop' then while true do end end
    if mode == 'wait' then
        local count = 0
        while true do
            count = count + 1
            ctx.publish({phase = 'waiting', samples = count, echo = ctx.params.echo})
            wait(25)
        end
    end
    return {ok = true, echo = ctx.params.echo, health = getCharHealth(PLAYER_PED),
        command_id = ctx.command_id}
end
