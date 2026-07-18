scoreboard players operation #travel_destination tide.identifier.island = @s tide.raft.travel
scoreboard players reset @s tide.raft.travel

execute unless entity @s[tag=tide.raft.travel.session] run return fail
tag @s remove tide.raft.travel.session
scoreboard players reset @s tide.raft.travel.age

execute if score #travel_destination tide.identifier.island matches 1 run return run function tide:island/raft/ocean/select

scoreboard players remove #travel_destination tide.identifier.island 2
scoreboard players reset @s tide.raft.source

execute unless score #travel_destination tide.identifier.island matches 0.. run title @s actionbar {"text":"That destination is invalid.","color":"#D94286"}
execute unless score #travel_destination tide.identifier.island matches 0.. run return fail

scoreboard players set #travel_friend_valid tide.raft.tmp 0
function tide:island/raft/destination/validate/start
execute unless score #travel_friend_valid tide.raft.tmp matches 1 run title @s actionbar {"text":"That island is no longer available to you.","color":"#D94286"}
execute unless score #travel_friend_valid tide.raft.tmp matches 1 run return fail

scoreboard players operation #travel_player tide.identifier.player = @s tide.identifier.player
scoreboard players set #travel_available tide.raft.tmp 0
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry,tag=!tide.island.destroying] if score @s tide.identifier.island = #travel_destination tide.identifier.island if score @s tide.island.state matches 2 if score @s tide.raft.state matches 1 run scoreboard players set #travel_available tide.raft.tmp 1
execute unless score #travel_available tide.raft.tmp matches 1 run title @s actionbar {"text":"That island no longer has a deployed raft.","color":"#D94286"}
execute unless score #travel_available tide.raft.tmp matches 1 run return fail

scoreboard players operation @s tide.raft.destination = #travel_destination tide.identifier.island
tag @s add tide.raft.travel.departing
scoreboard players set @s tide.raft.travel.age 0
function tide:runtime/loading/start
return 1
