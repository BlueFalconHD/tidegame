scoreboard players operation #tile_max_x tide.chunkload = #tile_x tide.chunkload
scoreboard players operation #tile_max_x tide.chunkload += #tile_width tide.chunkload
scoreboard players remove #tile_max_x tide.chunkload 1
execute if score #tile_max_x tide.chunkload > #max_chunk_x tide.chunkload run scoreboard players operation #tile_max_x tide.chunkload = #max_chunk_x tide.chunkload

scoreboard players operation #tile_max_z tide.chunkload = #tile_z tide.chunkload
scoreboard players operation #tile_max_z tide.chunkload += #tile_height tide.chunkload
scoreboard players remove #tile_max_z tide.chunkload 1
execute if score #tile_max_z tide.chunkload > #max_chunk_z tide.chunkload run scoreboard players operation #tile_max_z tide.chunkload = #max_chunk_z tide.chunkload

data modify storage tide:chunkload scratch set value {}
data modify storage tide:chunkload scratch.dimension set from storage tide:chunkload active.dimension
execute store result storage tide:chunkload scratch.min_x int 16 run scoreboard players get #tile_x tide.chunkload
execute store result storage tide:chunkload scratch.min_z int 16 run scoreboard players get #tile_z tide.chunkload
execute store result storage tide:chunkload scratch.max_x int 16 run scoreboard players get #tile_max_x tide.chunkload
execute store result storage tide:chunkload scratch.max_z int 16 run scoreboard players get #tile_max_z tide.chunkload
return 1
