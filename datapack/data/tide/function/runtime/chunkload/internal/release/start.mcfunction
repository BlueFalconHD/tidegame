function tide:runtime/chunkload/internal/tiles/configure
scoreboard players operation #tile_x tide.chunkload = #min_chunk_x tide.chunkload
scoreboard players operation #tile_z tide.chunkload = #min_chunk_z tide.chunkload

scoreboard players operation #tile_remainder_x tide.chunkload = #max_chunk_x tide.chunkload
scoreboard players operation #tile_remainder_x tide.chunkload -= #min_chunk_x tide.chunkload
scoreboard players operation #tile_remainder_x tide.chunkload %= #tile_width tide.chunkload
scoreboard players operation #release_last_x tide.chunkload = #max_chunk_x tide.chunkload
scoreboard players operation #release_last_x tide.chunkload -= #tile_remainder_x tide.chunkload

scoreboard players operation #tile_remainder_z tide.chunkload = #max_chunk_z tide.chunkload
scoreboard players operation #tile_remainder_z tide.chunkload -= #min_chunk_z tide.chunkload
scoreboard players operation #tile_remainder_z tide.chunkload %= #tile_height tide.chunkload
scoreboard players operation #release_last_z tide.chunkload = #max_chunk_z tide.chunkload
scoreboard players operation #release_last_z tide.chunkload -= #tile_remainder_z tide.chunkload

execute if data storage tide:chunkload active.last_forced_tile_x store result score #release_last_x tide.chunkload run data get storage tide:chunkload active.last_forced_tile_x
execute if data storage tide:chunkload active.last_forced_tile_z store result score #release_last_z tide.chunkload run data get storage tide:chunkload active.last_forced_tile_z
return 1
