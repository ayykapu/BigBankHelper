function add_delay(func, delay)
    managers.enemy:add_delayed_clbk("DelayedGetFunction", func, TimerManager:game():time() + delay)
end

function get_player_position()
    local player = managers.player:player_unit()
    local position = player:position()
    local positionString = string.format("%f/%f", position.x, position.y)

    return positionString
end