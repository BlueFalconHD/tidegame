scoreboard players set #add_ok tide.wgen 0
$execute in $(dimension) store success score #add_ok tide.wgen run forceload add $(x) $(z)
execute unless score #add_ok tide.wgen matches 1 run scoreboard players set #acquire_ok tide.wgen 0
execute if score #add_ok tide.wgen matches 1 run data modify storage tide:worldgen active.owned append from storage tide:worldgen scratch
