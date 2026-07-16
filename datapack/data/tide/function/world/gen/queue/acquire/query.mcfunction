scoreboard players set #was_forced tide.wgen 0
$execute in $(dimension) store success score #was_forced tide.wgen run forceload query $(x) $(z)
execute unless score #was_forced tide.wgen matches 1 run function tide:world/gen/queue/acquire/add with storage tide:worldgen scratch
