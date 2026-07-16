data modify storage tide:worldgen last_error set value {code:"queue_full",message:"The pending FIFO has reached config.max_queue."}
data modify storage tide:worldgen last_error.job set from storage tide:worldgen work
data remove storage tide:worldgen work
return fail
