-- Example for gta_run_script, not a standalone MoonLoader script.
return function(ctx)
    ctx.publish({phase = 'sampling', samples = 0})
    local samples = {}
    for i = 1, (ctx.params.samples or 3) do
        local x, y, z = getCharCoordinates(PLAYER_PED)
        samples[#samples + 1] = {x = x, y = y, z = z, health = getCharHealth(PLAYER_PED)}
        ctx.publish({phase = 'sampling', samples = #samples, latest = samples[#samples]})
        wait(ctx.params.interval_ms or 250)
    end
    return {phase = 'completed', samples = samples, command_id = ctx.command_id}
end
