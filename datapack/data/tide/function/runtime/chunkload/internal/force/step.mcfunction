function tide:runtime/chunkload/internal/tiles/configure
function tide:runtime/chunkload/internal/tiles/prepare
function tide:runtime/chunkload/internal/force/one with storage tide:chunkload scratch

execute store result storage tide:chunkload active.last_forced_tile_x int 1 run scoreboard players get #tile_x tide.chunkload
execute store result storage tide:chunkload active.last_forced_tile_z int 1 run scoreboard players get #tile_z tide.chunkload

scoreboard players set #force_complete tide.chunkload 0
execute if score #tile_max_x tide.chunkload = #max_chunk_x tide.chunkload if score #tile_max_z tide.chunkload = #max_chunk_z tide.chunkload run scoreboard players set #force_complete tide.chunkload 1
execute if score #force_complete tide.chunkload matches 1 run data modify storage tide:chunkload active.status set value "loading"
execute if score #force_complete tide.chunkload matches 1 run function tide:runtime/chunkload/internal/check/start
execute if score #force_complete tide.chunkload matches 1 run return 1

return run function tide:runtime/chunkload/internal/tiles/advance
