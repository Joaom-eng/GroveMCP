return function(ctx)
    local health = getCharHealth(PLAYER_PED)
    ctx.publish({ health = health })
    return { health = health }
end
