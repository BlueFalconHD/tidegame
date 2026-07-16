execute store result score #scan_x tide.wgen run data get storage tide:worldgen active.min_chunk_x
execute store result score #scan_z tide.wgen run data get storage tide:worldgen active.min_chunk_z
execute store result score #scan_min_x tide.wgen run data get storage tide:worldgen active.min_chunk_x
execute store result score #scan_max_x tide.wgen run data get storage tide:worldgen active.max_chunk_x
execute store result score #scan_max_z tide.wgen run data get storage tide:worldgen active.max_chunk_z
scoreboard players set #all_ready tide.wgen 1

function tide:world/gen/queue/check/step
