script_name('MCP Grove Vehicle Test')
script_author('McpServer project')
script_description('Recruit a Grove member with an M4 and observe natural group vehicle entry.')

local npc, car
local state = {}

local function record(stage, extra)
    state.stage = stage
    state.npc = npc
    state.car = car
    state.game_time_ms = getGameTimer()
    if extra then for key, value in pairs(extra) do state[key] = value end end
    local root = getWorkingDirectory():gsub('[/\\]moonloader[/\\]?$', '')
    local file = io.open(root .. '/mcp_scripts/grove_vehicle_result.json', 'w')
    if file then file:write(encodeJson(state)); file:close() end
    print('MCP Grove Vehicle Test: ' .. encodeJson(state))
end

function main()
    local cj = PLAYER_PED
    assert(doesCharExist(cj) and not isCharDead(cj), 'CJ is unavailable')
    local group = getPlayerGroup(PLAYER_HANDLE)
    assert(isGroupLeader(cj, group), 'CJ is not the leader of an available player group')

    -- peds.ide: model 105 (FAM1) belongs to GANG2 = Grove Street, ped type 8.
    -- Sultan has four seats. M4 weapon type 31 uses model 356.
    requestModel(105)
    requestModel(560)
    requestModel(356)
    loadAllModelsNow()
    assert(hasModelLoaded(105) and hasModelLoaded(560) and hasModelLoaded(356), 'Required models did not load')

    local px, py, pz = getOffsetFromCharInWorldCoords(cj, 3, 0, 0)
    npc = createChar(8, 105, px, py, pz)
    assert(doesCharExist(npc), 'NPC creation failed')
    setCharHeading(npc, getCharHeading(cj))
    setGroupMember(group, npc)
    if not isGroupMember(npc, group) then
        deleteChar(npc)
        npc = nil
        error('Recruitment failed; the player group may already be full')
    end
    setCharNeverLeavesGroup(npc, true)
    giveWeaponToChar(npc, 31, 300)
    setCurrentCharWeapon(npc, 31)
    record('npc_recruited', {group = group, npc_model = 105, weapon = 31,
        npc_pointer = string.format('0x%08X', getCharPointer(npc))})

    local cx, cy, cz = getOffsetFromCharInWorldCoords(cj, 0, 6, 0)
    local ground = getGroundZFor3dCoord(cx, cy, cz + 3)
    car = createCar(560, cx, cy, ground + 0.5)
    assert(doesVehicleExist(car), 'Vehicle creation failed')
    setCarHeading(car, getCharHeading(cj))
    warpCharIntoCar(cj, car)
    assert(isCharInCar(cj, car), 'CJ did not enter the vehicle')
    markModelAsNoLongerNeeded(105)
    markModelAsNoLongerNeeded(560)
    markModelAsNoLongerNeeded(356)
    record('cj_in_car', {car_model = 560, npc_in_car = isCharInCar(npc, car),
        car_pointer = string.format('0x%08X', getCarPointer(car))})
    printStringNow('~g~Grove + M4 recrutado.~n~~w~Aguardando entrada natural no Sultan.', 6000)

    -- No taskEnterCar and no NPC warp: this is the normal player-group AI.
    local started = getGameTimer()
    local entered = false
    while getGameTimer() - started < 30000 do
        wait(500)
        if not doesCharExist(npc) or isCharDead(npc) or not doesVehicleExist(car) then
            record('entity_unavailable')
            break
        end
        if isCharInCar(npc, car) then
            entered = true
            record('npc_entered_naturally', {npc_in_car = true,
                elapsed_ms = getGameTimer() - started})
            printStringNow('~g~O membro entrou naturalmente no carro!', 6000)
            break
        end
        local nx, ny, nz = getCharCoordinates(npc)
        local vx, vy, vz = getCarCoordinates(car)
        record('waiting_for_npc', {npc_in_car = false,
            distance_to_car = math.sqrt((nx-vx)^2 + (ny-vy)^2 + (nz-vz)^2)})
    end
    if not entered and doesCharExist(npc) and not isCharDead(npc) and doesVehicleExist(car) then
        record('entry_timeout', {npc_in_car = false})
    end
    -- Keep the requested entities available for the user after observation.
    -- This script does not remove them or alter existing player group members.
    wait(-1)
end
