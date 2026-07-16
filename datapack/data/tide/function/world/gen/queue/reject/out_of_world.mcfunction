data modify storage tide:worldgen last_error set value {code:"out_of_world",message:"Job X/Z coordinates must be between -30000000 and 29999999."}
data modify storage tide:worldgen last_error.job set from storage tide:worldgen work
data remove storage tide:worldgen work
return fail
