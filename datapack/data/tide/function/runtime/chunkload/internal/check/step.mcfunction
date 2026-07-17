data modify storage tide:chunkload scratch set value {}
data modify storage tide:chunkload scratch.dimension set from storage tide:chunkload active.dimension
data modify storage tide:chunkload scratch.y set from storage tide:chunkload active.y
execute store result storage tide:chunkload scratch.x int 16 run scoreboard players get #scan_x tide.chunkload
execute store result storage tide:chunkload scratch.z int 16 run scoreboard players get #scan_z tide.chunkload

scoreboard players set #chunk_ready tide.chunkload 0
function tide:runtime/chunkload/internal/check/one with storage tide:chunkload scratch
execute unless score #chunk_ready tide.chunkload matches 1 run return 0

scoreboard players set #scan_complete tide.chunkload 0
execute if score #scan_x tide.chunkload = #scan_max_x tide.chunkload if score #scan_z tide.chunkload = #scan_max_z tide.chunkload run scoreboard players set #scan_complete tide.chunkload 1
execute if score #scan_complete tide.chunkload matches 1 run scoreboard players set #all_ready tide.chunkload 1
execute if score #scan_complete tide.chunkload matches 1 run return 1

scoreboard players set #row_end tide.chunkload 0
execute if score #scan_x tide.chunkload = #scan_max_x tide.chunkload run scoreboard players set #row_end tide.chunkload 1
execute unless score #row_end tide.chunkload matches 1 run scoreboard players add #scan_x tide.chunkload 1
execute if score #row_end tide.chunkload matches 1 run scoreboard players operation #scan_x tide.chunkload = #scan_min_x tide.chunkload
execute if score #row_end tide.chunkload matches 1 run scoreboard players add #scan_z tide.chunkload 1

scoreboard players remove #check_budget tide.chunkload 1
execute if score #check_budget tide.chunkload matches 1.. run return run function tide:runtime/chunkload/internal/check/step
return 0
