data modify storage tide:worldgen last_error set value {code:"invalid_timeout",message:"timeout_ticks must be zero (disabled) or a positive integer."}
data modify storage tide:worldgen last_error.job set from storage tide:worldgen work
data remove storage tide:worldgen work
return fail
