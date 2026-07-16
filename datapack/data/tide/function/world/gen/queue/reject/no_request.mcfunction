data modify storage tide:worldgen last_error set value {code:"no_request",message:"Set tide:worldgen request to a job compound before calling enqueue."}
data remove storage tide:worldgen work
return fail
