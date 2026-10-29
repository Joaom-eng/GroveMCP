return function(ctx)
    assert(doesCharExist(PLAYER_PED), 'CJ indisponivel')
    local names = {}
    local file = io.open('C:/games/GTA San Andreas/data/peds.ide', 'r')
    if file then
        for line in file:lines() do
            local model, name = line:match('^%s*(%d+)%s*,%s*([^,%s]+)')
            if model then names[tonumber(model)] = name end
        end
        file:close()
    end
    local cx, cy, cz = getCharCoordinates(PLAYER_PED)
    local peds = {}
    for _, ped in ipairs(getAllChars()) do
        if ped ~= PLAYER_PED and doesCharExist(ped) then
            local px, py, pz = getCharCoordinates(ped)
            local distance = math.sqrt((px-cx)^2 + (py-cy)^2 + (pz-cz)^2)
            if distance <= 30 then
                local model = getCharModel(ped)
                peds[#peds + 1] = {ped = ped, model = model, name = names[model],
                    male = isCharMale(ped), distance = math.floor(distance * 10 + 0.5) / 10,
                    health = getCharHealth(ped), weapon = getCurrentCharWeapon(ped),
                    in_vehicle = isCharInAnyCar(ped)}
            end
        end
    end
    table.sort(peds, function(first, second) return first.distance < second.distance end)
    local total = #peds
    while #peds > 25 do table.remove(peds) end
    return {radius = 30, total = total, peds = peds}
end
