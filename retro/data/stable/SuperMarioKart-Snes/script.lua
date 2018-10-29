p1_previous_progress = data.p1_progress
function get_reward()
    local p1_reward = sign(data.p1_progress - p1_previous_progress)
    p1_previous_progress = data.p1_progress
    p1_reward = p1_reward/(data.p1_placing/2 + 1)
    return p1_reward
end

TIMEOUT = 60*10 -- 10s timeout
p1_max_progress = data.p1_progress
p1_progress_timer = TIMEOUT
function done_check()
    p1_progress_timer = p1_progress_timer - 1
    if data.p1_progress > p1_max_progress then
        p1_max_progress = data.p1_progress
        p1_progress_timer = TIMEOUT
    end
    if data.finished ~= 0 or p1_progress_timer <= 0 then
        return true
    end
    return false
end

function sign(x)
    if x<0 then
      return -1
    elseif x>0 then
      return 1
    else
      return 0
    end
 end