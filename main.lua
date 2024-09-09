dofile(ModPath .. "utility.lua")

-- Hook to trigger get_player_position on player entering state
Hooks:PostHook(PlayerStandard, "enter", "PostInitManagers", function()
    add_delay(get_player_position, 0.1)

    positionString = get_player_position()
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
        execute_movement(3)
    end
end)

-- Placeholder functions for different position cases
function position1_case()
    log("pos1 case")
end

function position2_case()
    log("pos2 case")
end

function position3_case()
    log("pos3 case")
end

function position4_case()
    log("pos4 case")
end

function upstairs()
    -- upstairs function code
end