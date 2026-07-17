function tide:runtime/chunkload/internal/tiles/configure
scoreboard players operation #tile_x tide.chunkload = #min_chunk_x tide.chunkload
scoreboard players operation #tile_z tide.chunkload = #min_chunk_z tide.chunkload
return run function tide:runtime/chunkload/internal/force/step
