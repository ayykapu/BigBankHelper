local AutoWalk = require("AutoWalk")

local function get_player_position()
    local player = managers.player:player_unit()
    local position = player:position()
    local positionString = string.format("%f/%f", position.x, position.y)
    log(positionString)
    
    if positionString == "6644.000000/107.000000" then
        position1_case()
    elseif positionString == "6675.000000/-0.000069" then
        position2_case()
    elseif positionString == "6675.000000/-100.000000" then
        position3_case()
    elseif positionString == "6625.000000/-250.000000" then
        position4_case()
    else
        log("unknown position")
        _G.auto_walk = AutoWalk:new(20)
        _G.auto_walk:start()
    end
end

Hooks:PostHook(PlayerStandard, "enter", "PostInitManagers", function(playerstate)
    execute_after_delay(get_player_position, 0.1)
end)

local function execute_after_delay(func, delay)
    managers.enemy:add_delayed_clbk("DelayedGetPlayerPosition", func, TimerManager:game():time() + delay)
end

-- placeholder functions for different position cases
local function position1_case()
    log("pos1 case")
end

local function position2_case()
    log("pos2 case")
end

local function position3_case()
    log("pos3 case")
end

local function position4_case()
    log("pos4 case")
end

local function upstairs()
    -- todo
end

-- update loop
Hooks:Add("GameSetupUpdate", "GameSetupUpdateAutoWalk", function(t, dt)
    if _G.auto_walk then
        _G.auto_walk:update()
    end
end)
