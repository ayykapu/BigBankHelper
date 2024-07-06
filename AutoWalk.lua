AutoWalk = {}
AutoWalk.__index = AutoWalk

function AutoWalk:new(duration)
    local obj = {
        duration = duration,
        start_time = nil,
        is_active = false,
    }
    setmetatable(obj, self)
    return obj
end

function AutoWalk:start()
    self.start_time = TimerManager:game():time()
    self.is_active = true

    Hooks:PostHook(PlayerStandard, "_determine_move_direction", "ForceMoveDirection", function(playerstate)
        if self.is_active then
            mvector3.set_y(playerstate._stick_move, 1)
            mvector3.normalize(playerstate._stick_move)

            playerstate._move_dir = mvector3.copy(playerstate._stick_move)
            mvector3.rotate_with(playerstate._move_dir, Rotation(playerstate._cam_fwd_flat, math.UP))
            playerstate._normal_move_dir = mvector3.copy(playerstate._move_dir)
        end
    end)
end

function AutoWalk:update()
    if self.is_active and (TimerManager:game():time() - self.start_time) > self.duration then
        self:stop()
    end
end

function AutoWalk:stop()
    self.is_active = false
end

return AutoWalk
