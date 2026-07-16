data modify storage tide:worldgen last_error set value {code:"missing_fields",message:"A job requires dimension, callback, x, y, z, min_x, min_z, max_x, and max_z."}
data modify storage tide:worldgen last_error.job set from storage tide:worldgen work
data remove storage tide:worldgen work
return fail
