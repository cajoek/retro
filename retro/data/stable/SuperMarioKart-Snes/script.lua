TIMEOUT = 60*15 -- 15s timeout
progress_timer = TIMEOUT

p0_max_progress = data.p0_progress
p0_previous_progress = data.p0_progress
function get_reward0()
    progress_timer = progress_timer - 1
    if data.p0_progress > p0_max_progress then
        p0_max_progress = data.p0_progress
        p0_previous_progress = data.p0_progress
        progress_timer = TIMEOUT
        return 1/(data.p0_placing/2 + 1)
    elseif data.p0_progress < p0_previous_progress then
        p0_previous_progress = data.p0_progress
        return -1/(data.p0_placing/2 + 1)
    end
    p0_previous_progress = data.p0_progress
    return 0
end

p1_max_progress = data.p1_progress
p1_previous_progress = data.p1_progress
function get_reward1()
    if data.p1_progress > p1_max_progress then
        p1_max_progress = data.p1_progress
        p1_previous_progress = data.p1_progress
        progress_timer = TIMEOUT
        return 1/(data.p1_placing/2 + 1)
    elseif data.p1_progress < p1_previous_progress then
        p1_previous_progress = data.p1_progress
        return -1/(data.p1_placing/2 + 1)
    end
    p1_previous_progress = data.p1_progress
    return 0
end


function done_check()
    if data.finished ~= 0 or progress_timer <= 0 then
        return true
    end
    return false
end
