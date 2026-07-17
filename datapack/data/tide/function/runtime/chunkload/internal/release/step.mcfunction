function tide:runtime/chunkload/internal/tiles/configure
function tide:runtime/chunkload/internal/tiles/prepare
function tide:runtime/chunkload/internal/release/one with storage tide:chunkload scratch

scoreboard players set #release_complete tide.chunkload 0
execute if score #tile_x tide.chunkload = #release_last_x tide.chunkload if score #tile_z tide.chunkload = #release_last_z tide.chunkload run scoreboard players set #release_complete tide.chunkload 1
execute if score #release_complete tide.chunkload matches 1 run return run function tide:runtime/chunkload/internal/release/finish

return run function tide:runtime/chunkload/internal/tiles/advance
