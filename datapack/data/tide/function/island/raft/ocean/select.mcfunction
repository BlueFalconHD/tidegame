scoreboard players operation #travel_source tide.identifier.island = @s tide.raft.source
scoreboard players set #travel_available tide.raft.tmp 0
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry,tag=!tide.island.destroying] if score @s tide.identifier.island = #travel_source tide.identifier.island if score @s tide.island.state matches 2 if score @s tide.raft.state matches 1 run scoreboard players set #travel_available tide.raft.tmp 1
execute unless score #travel_available tide.raft.tmp matches 1 run title @s actionbar {"text":"This island no longer has a deployed raft.","color":"#D94286"}
execute unless score #travel_available tide.raft.tmp matches 1 run scoreboard players reset @s tide.raft.source
execute unless score #travel_available tide.raft.tmp matches 1 run return fail

scoreboard players set @s tide.raft.destination -1
tag @s add tide.raft.travel.departing
scoreboard players set @s tide.raft.travel.age 0
function tide:runtime/loading/start
return 1
