function get_player_position()
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
    end
end

-- Function to execute after delay
local function execute_after_delay(func, delay)
    managers.enemy:add_delayed_clbk("DelayedGetPlayerPosition", func, TimerManager:game():time() + delay)
end

-- Hook to trigger get_player_position on player entering state
Hooks:PostHook(PlayerStandard, "enter", "PostInitManagers", function()
    execute_after_delay(get_player_position, 0.1)
end)

-- Placeholder functions for different position cases
function position1_case()
    log("pos1 case")
    -- Activate the ForceMove
    _G.force_move = ForceMove:new(20)
    _G.force_move:start()
end

function position2_case()
    log("pos2 case")
    -- Activate the ForceMove
    _G.force_move = ForceMove:new(20)
    _G.force_move:start()
end

function position3_case()
    log("pos3 case")
    -- Activate the ForceMove
    _G.force_move = ForceMove:new(20)
    _G.force_move:start()
end

function position4_case()
    log("pos4 case")
    -- Activate the ForceMove
    _G.force_move = ForceMove:new(20)
    _G.force_move:start()
end

function upstairs()
    -- Your upstairs function code
end

Hooks:Add("GameSetupUpdate", "GameSetupUpdateForceMove", function(t, dt)
    if _G.force_move then
        _G.force_move:update()
    end
end)
