data modify storage tide:worldgen scratch set value {}
data modify storage tide:worldgen scratch.dimension set from storage tide:worldgen active.dimension
execute store result storage tide:worldgen scratch.x int 16 run scoreboard players get #scan_x tide.wgen
execute store result storage tide:worldgen scratch.z int 16 run scoreboard players get #scan_z tide.wgen

function tide:world/gen/queue/check/one with storage tide:worldgen scratch
execute unless score #all_ready tide.wgen matches 1 run return 0

scoreboard players set #row_end tide.wgen 0
execute if score #scan_x tide.wgen = #scan_max_x tide.wgen run scoreboard players set #row_end tide.wgen 1
execute unless score #row_end tide.wgen matches 1 run scoreboard players add #scan_x tide.wgen 1
execute unless score #row_end tide.wgen matches 1 run return run function tide:world/gen/queue/check/step

scoreboard players operation #scan_x tide.wgen = #scan_min_x tide.wgen
scoreboard players add #scan_z tide.wgen 1
execute if score #scan_z tide.wgen <= #scan_max_z tide.wgen run return run function tide:world/gen/queue/check/step
return 1
