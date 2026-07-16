execute store result score #scan_x tide.chunkload run data get storage tide:chunkload active.min_chunk_x
execute store result score #scan_z tide.chunkload run data get storage tide:chunkload active.min_chunk_z
execute store result score #scan_min_x tide.chunkload run data get storage tide:chunkload active.min_chunk_x
execute store result score #scan_max_x tide.chunkload run data get storage tide:chunkload active.max_chunk_x
execute store result score #scan_max_z tide.chunkload run data get storage tide:chunkload active.max_chunk_z
scoreboard players set #all_ready tide.chunkload 1

function tide:runtime/chunkload/internal/check/step
