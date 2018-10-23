p1_previous_progress = data.p1_progress
p2_previous_progress = data.p2_progress
function get_reward()
    local p1_reward = sign(data.p1_progress - p1_previous_progress)
    local p2_reward = sign(data.p2_progress - p2_previous_progress)
    p1_previous_progress = data.p1_progress
    p2_previous_progress = data.p2_progress
    if p1_reward > 0 then
        p1_reward = p1_reward/(data.p1_placing/2 + 1)
    end
    if p2_reward > 0 then
        p2_reward = p2_reward/(data.p2_placing/2 + 1)
    end
    return p1_reward
end
    

function done_check()
    if data.finished == 0 then
        return false
    end
    return true
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