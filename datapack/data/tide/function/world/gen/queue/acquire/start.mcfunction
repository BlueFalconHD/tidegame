execute store result score #scan_x tide.wgen run data get storage tide:worldgen active.min_chunk_x
execute store result score #scan_z tide.wgen run data get storage tide:worldgen active.min_chunk_z
execute store result score #scan_min_x tide.wgen run data get storage tide:worldgen active.min_chunk_x
execute store result score #scan_max_x tide.wgen run data get storage tide:worldgen active.max_chunk_x
execute store result score #scan_max_z tide.wgen run data get storage tide:worldgen active.max_chunk_z
scoreboard players set #acquire_ok tide.wgen 1

function tide:world/gen/queue/acquire/step

execute unless score #acquire_ok tide.wgen matches 1 if data storage tide:worldgen active run data modify storage tide:worldgen active.error set value {code:"forceload_failed",message:"Could not acquire every required forced-chunk ticket."}
execute unless score #acquire_ok tide.wgen matches 1 if data storage tide:worldgen active run function tide:world/gen/queue/fail
