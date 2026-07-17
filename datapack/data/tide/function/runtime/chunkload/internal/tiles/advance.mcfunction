scoreboard players set #row_end tide.chunkload 0
execute if score #tile_max_x tide.chunkload = #max_chunk_x tide.chunkload run scoreboard players set #row_end tide.chunkload 1
execute unless score #row_end tide.chunkload matches 1 run scoreboard players operation #tile_x tide.chunkload = #tile_max_x tide.chunkload
execute unless score #row_end tide.chunkload matches 1 run scoreboard players add #tile_x tide.chunkload 1
execute if score #row_end tide.chunkload matches 1 run scoreboard players operation #tile_x tide.chunkload = #min_chunk_x tide.chunkload
execute if score #row_end tide.chunkload matches 1 run scoreboard players operation #tile_z tide.chunkload = #tile_max_z tide.chunkload
execute if score #row_end tide.chunkload matches 1 run scoreboard players add #tile_z tide.chunkload 1
return 1
