# Expects tide:chunkload.request to be filled with
# `dimension`: dimension resource location in which the callback runs.
# `callback`: function resource location invoked when every required chunk is ready.
# `x`, `y`, `z`: absolute callback origin.
# `min_x`, `min_z`, `max_x`, `max_z`: inclusive block-space bounds to load.

execute unless data storage tide:chunkload request run data modify storage tide:chunkload last_error set value "No request to enqueue"
execute unless data storage tide:chunkload request run return fail

scoreboard players set #request_valid tide.chunkload 0
execute store result score #request_valid tide.chunkload run function tide:runtime/chunkload/internal/enqueue/validate
execute unless score #request_valid tide.chunkload matches 1 run data modify storage tide:chunkload last_error set value "Request is missing a required field"
execute unless score #request_valid tide.chunkload matches 1 run data remove storage tide:chunkload request
execute unless score #request_valid tide.chunkload matches 1 run return fail

scoreboard players set #dimension_valid tide.chunkload 0
execute store success score #dimension_valid tide.chunkload run function tide:runtime/chunkload/internal/enqueue/validate_dimension with storage tide:chunkload request
execute unless score #dimension_valid tide.chunkload matches 1 run data modify storage tide:chunkload last_error set value "Request has an invalid dimension"
execute unless score #dimension_valid tide.chunkload matches 1 run data remove storage tide:chunkload request
execute unless score #dimension_valid tide.chunkload matches 1 run return fail

return run function tide:runtime/chunkload/internal/enqueue/normalize
