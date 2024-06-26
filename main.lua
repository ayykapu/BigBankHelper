local function get_player_position()    
        local player = managers.player:player_unit()
        local position = player:position()
        local positionString = string.format("%f/%f", position.x, position.y)
        log(positionString)

        if positionString == "6644.000000/107.000000" then
            log("pos1")
        elseif positionString == "6675.000000/-0.000069" then
            log("pos2")
        elseif positionString == "6675.000000/-100.000000" then
            log("pos3")
        elseif positionString == "6625.000000/-250.000000" then
            log("pos4")
        else 
            log("unknown position")
        end
end

local function execute_after_delay(func, delay)
    managers.enemy:add_delayed_clbk("DelayedGetPlayerPosition", func, TimerManager:game():time() + delay)
end

Hooks:PostHook(PlayerStandard, "enter", "BigBankHelperModPostInitManagers", function(self)
    execute_after_delay(get_player_position, 1)
end)