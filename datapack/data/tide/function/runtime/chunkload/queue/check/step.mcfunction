data modify storage tide:worldgen scratch set value {}
data modify storage tide:worldgen scratch.dimension set from storage tide:worldgen active.dimension
execute store result storage tide:worldgen scratch.x int 16 run scoreboard players get #scan_x tide.chunkload
execute store result storage tide:worldgen scratch.z int 16 run scoreboard players get #scan_z tide.chunkload

function tide:chunkload/queue/check/one with storage tide:worldgen scratch
execute unless score #all_ready tide.chunkload matches 1 run return 0

scoreboard players set #row_end tide.chunkload 0
execute if score #scan_x tide.chunkload = #scan_max_x tide.chunkload run scoreboard players set #row_end tide.chunkload 1
execute unless score #row_end tide.chunkload matches 1 run scoreboard players add #scan_x tide.chunkload 1
execute unless score #row_end tide.chunkload matches 1 run return run function tide:chunkload/queue/check/step

scoreboard players operation #scan_x tide.chunkload = #scan_min_x tide.chunkload
scoreboard players add #scan_z tide.chunkload 1
execute if score #scan_z tide.chunkload <= #scan_max_z tide.chunkload run return run function tide:chunkload/queue/check/step
return 1
