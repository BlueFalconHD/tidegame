execute store result score #min_chunk_x tide.chunkload run data get storage tide:chunkload active.min_chunk_x
execute store result score #min_chunk_z tide.chunkload run data get storage tide:chunkload active.min_chunk_z
execute store result score #max_chunk_x tide.chunkload run data get storage tide:chunkload active.max_chunk_x
execute store result score #max_chunk_z tide.chunkload run data get storage tide:chunkload active.max_chunk_z

scoreboard players operation #span_x tide.chunkload = #max_chunk_x tide.chunkload
scoreboard players operation #span_x tide.chunkload -= #min_chunk_x tide.chunkload
scoreboard players add #span_x tide.chunkload 1

scoreboard players operation #tile_width tide.chunkload = #span_x tide.chunkload
execute if score #tile_width tide.chunkload > #forceload_limit tide.chunkload run scoreboard players operation #tile_width tide.chunkload = #forceload_limit tide.chunkload
scoreboard players operation #tile_height tide.chunkload = #forceload_limit tide.chunkload
scoreboard players operation #tile_height tide.chunkload /= #tile_width tide.chunkload
return 1
