scoreboard players operation #ocean_return_player tide.identifier.player = @s tide.identifier.player
scoreboard players operation #ocean_return_island tide.identifier.island = @s tide.identifier.island
scoreboard players set #ocean_return_available tide.location.tmp 0
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry,tag=!tide.island.destroying] if score @s tide.identifier.island = #ocean_return_island tide.identifier.island if score @s tide.island.state matches 2 if score @s tide.raft.state matches 1 run function tide:world/ocean/return_home/internal/prepare_request
execute unless score #ocean_return_available tide.location.tmp matches 1 run title @s actionbar {"text":"Your home raft could not be reached.","color":"#D94286"}
execute unless score #ocean_return_available tide.location.tmp matches 1 run return run function tide:world/ocean/return_home/fallback

scoreboard players set #ocean_return_enqueued tide.location.tmp 0
execute store result score #ocean_return_enqueued tide.location.tmp run function tide:runtime/chunkload/enqueue
execute unless score #ocean_return_enqueued tide.location.tmp matches 1 run title @s actionbar {"text":"The return voyage could not be started.","color":"#D94286"}
execute unless score #ocean_return_enqueued tide.location.tmp matches 1 run return run function tide:world/ocean/return_home/fallback

tag @s remove tide.ocean.returning
tag @s add tide.ocean.return.pending
scoreboard players set @s tide.area_transition 6000
return 1
