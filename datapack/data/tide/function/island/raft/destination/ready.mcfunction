$scoreboard players set #travel_player tide.identifier.player $(traveler)
$scoreboard players set #travel_destination tide.identifier.island $(island)

tag @a remove tide.raft.traveler
execute as @a[tag=tide.raft.travel.pending] if score @s tide.identifier.player = #travel_player tide.identifier.player if score @s tide.raft.destination = #travel_destination tide.identifier.island run tag @s add tide.raft.traveler
# A timed-out request may finish after the player has begun a different voyage.
execute unless entity @a[tag=tide.raft.traveler] run return 1

scoreboard players set #travel_friend_valid tide.raft.tmp 0
execute as @a[tag=tide.raft.traveler,limit=1] run function tide:island/raft/destination/validate/start
execute unless score #travel_friend_valid tide.raft.tmp matches 1 as @a[tag=tide.raft.traveler,limit=1] run title @s actionbar {"text":"That island is no longer available to you.","color":"#D94286"}
execute unless score #travel_friend_valid tide.raft.tmp matches 1 as @a[tag=tide.raft.traveler,limit=1] run function tide:island/raft/destination/internal/expire
execute unless score #travel_friend_valid tide.raft.tmp matches 1 run tag @a remove tide.raft.traveler
execute unless score #travel_friend_valid tide.raft.tmp matches 1 run return 1

scoreboard players set #travel_available tide.raft.tmp 0
data modify storage tide:raft scratch.arrival_name set value "Unnamed Island"
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry,tag=!tide.island.destroying] if score @s tide.identifier.island = #travel_destination tide.identifier.island if score @s tide.island.state matches 2 if score @s tide.raft.state matches 1 run function tide:island/raft/destination/internal/read_arrival
execute unless score #travel_available tide.raft.tmp matches 1 as @a[tag=tide.raft.traveler,limit=1] run title @s actionbar {"text":"That island no longer has a deployed raft.","color":"#D94286"}
execute unless score #travel_available tide.raft.tmp matches 1 as @a[tag=tide.raft.traveler,limit=1] run function tide:island/raft/destination/internal/expire
execute unless score #travel_available tide.raft.tmp matches 1 run tag @a remove tide.raft.traveler
execute unless score #travel_available tide.raft.tmp matches 1 run return 1

tag @e[type=minecraft:bamboo_raft,tag=tide.raft.destination] remove tide.raft.destination
execute as @e[type=minecraft:bamboo_raft,tag=tide.raft.registered,distance=..4] if score @s tide.identifier.island = #travel_destination tide.identifier.island run tag @s add tide.raft.destination
execute unless entity @e[type=minecraft:bamboo_raft,tag=tide.raft.destination,sort=nearest,limit=1] as @a[tag=tide.raft.traveler,limit=1] run title @s actionbar {"text":"The destination raft could not be found.","color":"#D94286"}
execute unless entity @e[type=minecraft:bamboo_raft,tag=tide.raft.destination,sort=nearest,limit=1] as @a[tag=tide.raft.traveler,limit=1] run function tide:island/raft/destination/internal/expire
execute unless entity @e[type=minecraft:bamboo_raft,tag=tide.raft.destination,sort=nearest,limit=1] run tag @a remove tide.raft.traveler
execute unless entity @e[type=minecraft:bamboo_raft,tag=tide.raft.destination,sort=nearest,limit=1] run return 1

scoreboard players set #travel_teleported tide.raft.tmp 0
execute as @a[tag=tide.raft.traveler,limit=1] at @e[type=minecraft:bamboo_raft,tag=tide.raft.destination,sort=nearest,limit=1] store success score #travel_teleported tide.raft.tmp run tp @s ~ ~0.8 ~
tag @e[type=minecraft:bamboo_raft,tag=tide.raft.destination] remove tide.raft.destination

execute if score #travel_teleported tide.raft.tmp matches 1 as @a[tag=tide.raft.traveler,limit=1,scores={tide.loading.state=1..2}] run function tide:runtime/loading/stop
execute if score #travel_teleported tide.raft.tmp matches 1 as @a[tag=tide.raft.traveler,limit=1] run function tide:island/raft/destination/internal/cleanup
execute if score #travel_teleported tide.raft.tmp matches 1 as @a[tag=tide.raft.traveler,limit=1] run title @s actionbar [{"text":"Arrived at ","color":"#F2F2F2"},{"nbt":"scratch.arrival_name","storage":"tide:raft","color":"#09C7E0"}]
execute unless score #travel_teleported tide.raft.tmp matches 1 as @a[tag=tide.raft.traveler,limit=1] run title @s actionbar {"text":"The voyage could not be completed.","color":"#D94286"}
execute unless score #travel_teleported tide.raft.tmp matches 1 as @a[tag=tide.raft.traveler,limit=1] run function tide:island/raft/destination/internal/expire
tag @a remove tide.raft.traveler
return 1
