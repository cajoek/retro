TIMEOUT = 60*15 -- 15s timeout

max_progress = data.p1_progress
previous_progress = data.p1_progress
progress_timer = TIMEOUT
function get_reward()
    progress_timer = progress_timer - 1
    if data.p1_progress > max_progress then
        max_progress = data.p1_progress
        previous_progress = data.p1_progress
        progress_timer = TIMEOUT
        return 1/(data.p1_placing/2 + 1)
    elseif data.p1_progress < previous_progress then
        previous_progress = data.p1_progress
        return -1/(data.p1_placing/2 + 1)
    end
    previous_progress = data.p1_progress
    return 0
end


function done_check()
    if data.finished ~= 0 or progress_timer <= 0 then
        return true
    end
    return false
end