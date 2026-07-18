scoreboard players operation #travel_source tide.identifier.island = @s tide.raft.source
scoreboard players operation #travel_player tide.identifier.player = @s tide.identifier.player
scoreboard players set #travel_available tide.raft.tmp 0
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry,tag=!tide.island.destroying] if score @s tide.identifier.island = #travel_source tide.identifier.island if score @s tide.island.state matches 2 if score @s tide.raft.state matches 1 run function tide:island/raft/ocean/internal/prepare_request
execute unless score #travel_available tide.raft.tmp matches 1 run title @s actionbar {"text":"This island no longer has a deployed raft.","color":"#D94286"}
execute unless score #travel_available tide.raft.tmp matches 1 run return run function tide:island/raft/destination/internal/expire

scoreboard players set #travel_enqueued tide.raft.tmp 0
execute store result score #travel_enqueued tide.raft.tmp run function tide:runtime/chunkload/enqueue
execute unless score #travel_enqueued tide.raft.tmp matches 1 run title @s actionbar {"text":"The voyage could not be started.","color":"#D94286"}
execute unless score #travel_enqueued tide.raft.tmp matches 1 run return run function tide:island/raft/destination/internal/expire

tag @s remove tide.raft.travel.departing
tag @s add tide.raft.travel.pending
scoreboard players set @s tide.raft.travel.age 0
return 1
