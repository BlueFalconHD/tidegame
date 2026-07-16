data modify storage tide:worldgen last_error set value {code:"invalid_dimension",message:"The job dimension does not exist or is not a valid dimension resource location."}
data modify storage tide:worldgen last_error.job set from storage tide:worldgen work
data remove storage tide:worldgen work
return fail
