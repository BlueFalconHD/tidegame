scoreboard players set #input_min_x tide.wgen 0
scoreboard players set #input_min_z tide.wgen 0
scoreboard players set #input_max_x tide.wgen 0
scoreboard players set #input_max_z tide.wgen 0
scoreboard players set #origin_x tide.wgen 0
scoreboard players set #origin_y tide.wgen 0
scoreboard players set #origin_z tide.wgen 0
execute store result score #input_min_x tide.wgen run data get storage tide:worldgen work.min_x
execute store result score #input_min_z tide.wgen run data get storage tide:worldgen work.min_z
execute store result score #input_max_x tide.wgen run data get storage tide:worldgen work.max_x
execute store result score #input_max_z tide.wgen run data get storage tide:worldgen work.max_z
execute store result score #origin_x tide.wgen run data get storage tide:worldgen work.x
execute store result score #origin_y tide.wgen run data get storage tide:worldgen work.y
execute store result score #origin_z tide.wgen run data get storage tide:worldgen work.z

# /forceload rejects columns outside this range. Reject before floor-division can overflow.
execute unless score #input_min_x tide.wgen matches -30000000..29999999 run return run function tide:world/gen/queue/reject/out_of_world
execute unless score #input_min_z tide.wgen matches -30000000..29999999 run return run function tide:world/gen/queue/reject/out_of_world
execute unless score #input_max_x tide.wgen matches -30000000..29999999 run return run function tide:world/gen/queue/reject/out_of_world
execute unless score #input_max_z tide.wgen matches -30000000..29999999 run return run function tide:world/gen/queue/reject/out_of_world
execute unless score #origin_x tide.wgen matches -30000000..29999999 run return run function tide:world/gen/queue/reject/out_of_world
execute unless score #origin_z tide.wgen matches -30000000..29999999 run return run function tide:world/gen/queue/reject/out_of_world

# Normalize reversed bounding boxes.
scoreboard players operation #block_min_x tide.wgen = #input_min_x tide.wgen
scoreboard players operation #block_max_x tide.wgen = #input_min_x tide.wgen
execute if score #input_max_x tide.wgen < #block_min_x tide.wgen run scoreboard players operation #block_min_x tide.wgen = #input_max_x tide.wgen
execute if score #input_max_x tide.wgen > #block_max_x tide.wgen run scoreboard players operation #block_max_x tide.wgen = #input_max_x tide.wgen
scoreboard players operation #block_min_z tide.wgen = #input_min_z tide.wgen
scoreboard players operation #block_max_z tide.wgen = #input_min_z tide.wgen
execute if score #input_max_z tide.wgen < #block_min_z tide.wgen run scoreboard players operation #block_min_z tide.wgen = #input_max_z tide.wgen
execute if score #input_max_z tide.wgen > #block_max_z tide.wgen run scoreboard players operation #block_max_z tide.wgen = #input_max_z tide.wgen

# Scoreboard division is floor division, matching Minecraft's block-to-chunk conversion for negatives.
scoreboard players operation #min_chunk_x tide.wgen = #block_min_x tide.wgen
scoreboard players operation #max_chunk_x tide.wgen = #block_max_x tide.wgen
scoreboard players operation #min_chunk_z tide.wgen = #block_min_z tide.wgen
scoreboard players operation #max_chunk_z tide.wgen = #block_max_z tide.wgen
scoreboard players operation #min_chunk_x tide.wgen /= #sixteen tide.wgen
scoreboard players operation #max_chunk_x tide.wgen /= #sixteen tide.wgen
scoreboard players operation #min_chunk_z tide.wgen /= #sixteen tide.wgen
scoreboard players operation #max_chunk_z tide.wgen /= #sixteen tide.wgen

scoreboard players operation #chunk_width tide.wgen = #max_chunk_x tide.wgen
scoreboard players operation #chunk_width tide.wgen -= #min_chunk_x tide.wgen
scoreboard players add #chunk_width tide.wgen 1
scoreboard players operation #chunk_depth tide.wgen = #max_chunk_z tide.wgen
scoreboard players operation #chunk_depth tide.wgen -= #min_chunk_z tide.wgen
scoreboard players add #chunk_depth tide.wgen 1
# Reject pathological spans before multiplying, so chunk_count cannot overflow.
scoreboard players set #chunk_count tide.wgen 0
execute if score #chunk_width tide.wgen matches 257.. run return run function tide:world/gen/queue/reject/too_large
execute if score #chunk_depth tide.wgen matches 257.. run return run function tide:world/gen/queue/reject/too_large
scoreboard players operation #chunk_count tide.wgen = #chunk_width tide.wgen
scoreboard players operation #chunk_count tide.wgen *= #chunk_depth tide.wgen

scoreboard players set #max_span tide.wgen 5
scoreboard players set #max_chunks tide.wgen 25
execute store result score #max_span tide.wgen run data get storage tide:worldgen config.max_span
execute store result score #max_chunks tide.wgen run data get storage tide:worldgen config.max_chunks
execute if score #chunk_width tide.wgen > #max_span tide.wgen run return run function tide:world/gen/queue/reject/too_large
execute if score #chunk_depth tide.wgen > #max_span tide.wgen run return run function tide:world/gen/queue/reject/too_large
execute if score #chunk_count tide.wgen > #max_chunks tide.wgen run return run function tide:world/gen/queue/reject/too_large
execute if score #chunk_count tide.wgen matches 257.. run return run function tide:world/gen/queue/reject/too_large

# Zero disables the timeout; otherwise it is the number of polling ticks allowed.
scoreboard players set #timeout tide.wgen 1200
execute store result score #timeout tide.wgen run data get storage tide:worldgen config.timeout_ticks
execute if data storage tide:worldgen work.timeout_ticks store result score #timeout tide.wgen run data get storage tide:worldgen work.timeout_ticks
execute unless score #timeout tide.wgen matches 0.. run return run function tide:world/gen/queue/reject/invalid_timeout

# Validate that the dimension resource exists before the job enters the FIFO.
scoreboard players set #dimension_ok tide.wgen 0
function tide:world/gen/queue/validate_dimension with storage tide:worldgen work
execute unless score #dimension_ok tide.wgen matches 1 run return run function tide:world/gen/queue/reject/invalid_dimension

scoreboard players set #queue_size tide.wgen 0
scoreboard players set #max_queue tide.wgen 128
execute store result score #queue_size tide.wgen run data get storage tide:worldgen queue
execute store result score #max_queue tide.wgen run data get storage tide:worldgen config.max_queue
execute if score #queue_size tide.wgen >= #max_queue tide.wgen run return run function tide:world/gen/queue/reject/queue_full

# Store canonical integer values used by the poller and callback macro.
execute store result storage tide:worldgen work.x int 1 run scoreboard players get #origin_x tide.wgen
execute store result storage tide:worldgen work.y int 1 run scoreboard players get #origin_y tide.wgen
execute store result storage tide:worldgen work.z int 1 run scoreboard players get #origin_z tide.wgen
execute store result storage tide:worldgen work.min_x int 1 run scoreboard players get #block_min_x tide.wgen
execute store result storage tide:worldgen work.min_z int 1 run scoreboard players get #block_min_z tide.wgen
execute store result storage tide:worldgen work.max_x int 1 run scoreboard players get #block_max_x tide.wgen
execute store result storage tide:worldgen work.max_z int 1 run scoreboard players get #block_max_z tide.wgen
execute store result storage tide:worldgen work.min_chunk_x int 1 run scoreboard players get #min_chunk_x tide.wgen
execute store result storage tide:worldgen work.min_chunk_z int 1 run scoreboard players get #min_chunk_z tide.wgen
execute store result storage tide:worldgen work.max_chunk_x int 1 run scoreboard players get #max_chunk_x tide.wgen
execute store result storage tide:worldgen work.max_chunk_z int 1 run scoreboard players get #max_chunk_z tide.wgen
execute store result storage tide:worldgen work.chunk_count int 1 run scoreboard players get #chunk_count tide.wgen
execute store result storage tide:worldgen work.timeout_ticks int 1 run scoreboard players get #timeout tide.wgen
execute store result storage tide:worldgen work.id int 1 run scoreboard players get #next_id tide.wgen
execute unless data storage tide:worldgen work.payload run data modify storage tide:worldgen work.payload set value {}
data modify storage tide:worldgen work.age set value 0
data modify storage tide:worldgen work.status set value "queued"
data remove storage tide:worldgen work.error
data remove storage tide:worldgen work.owned

data modify storage tide:worldgen queue append from storage tide:worldgen work
data modify storage tide:worldgen last_enqueued set from storage tide:worldgen work
scoreboard players add #next_id tide.wgen 1
execute unless score #next_id tide.wgen matches 1.. run scoreboard players set #next_id tide.wgen 1
data remove storage tide:worldgen work

return run data get storage tide:worldgen last_enqueued.id
