function tide:world/gen/queue/check/start
execute if score #all_ready tide.wgen matches 1 run return run function tide:world/gen/queue/ready

execute store result score #age tide.wgen run data get storage tide:worldgen active.age
scoreboard players add #age tide.wgen 1
execute store result storage tide:worldgen active.age int 1 run scoreboard players get #age tide.wgen

execute store result score #timeout tide.wgen run data get storage tide:worldgen active.timeout_ticks
execute if score #timeout tide.wgen matches 0 run return 0
execute if score #age tide.wgen >= #timeout tide.wgen run data modify storage tide:worldgen active.error set value {code:"timeout",message:"Required chunks did not all become entity-ticking before timeout_ticks elapsed."}
execute if score #age tide.wgen >= #timeout tide.wgen run return run function tide:world/gen/queue/fail
return 0
