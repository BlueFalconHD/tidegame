$scoreboard players set #travel_player tide.identifier.player $(traveler)
$scoreboard players set #travel_source tide.identifier.island $(island)

tag @a remove tide.raft.traveler
execute as @a[tag=tide.raft.travel.pending,scores={tide.raft.destination=-1}] if score @s tide.identifier.player = #travel_player tide.identifier.player if score @s tide.raft.source = #travel_source tide.identifier.island run tag @s add tide.raft.traveler
# A timed-out request may finish after the player has begun a different voyage.
execute unless entity @a[tag=tide.raft.traveler] run return 1

scoreboard players set #travel_available tide.raft.tmp 0
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry,tag=!tide.island.destroying] if score @s tide.identifier.island = #travel_source tide.identifier.island if score @s tide.island.state matches 2 if score @s tide.raft.state matches 1 run scoreboard players set #travel_available tide.raft.tmp 1
execute unless score #travel_available tide.raft.tmp matches 1 as @a[tag=tide.raft.traveler,limit=1] run title @s actionbar {"text":"This island no longer has a deployed raft.","color":"#D94286"}
execute unless score #travel_available tide.raft.tmp matches 1 as @a[tag=tide.raft.traveler,limit=1] run function tide:island/raft/destination/internal/expire
execute unless score #travel_available tide.raft.tmp matches 1 run tag @a remove tide.raft.traveler
execute unless score #travel_available tide.raft.tmp matches 1 run return 1

# Reuse an abandoned arrival raft for this island when possible; otherwise
# create a fresh one at the persistent ocean entry point.
tag @e[type=minecraft:bamboo_raft,tag=tide.raft.ocean.available] remove tide.raft.ocean.available
execute as @e[type=minecraft:bamboo_raft,tag=tide.raft.ocean.arrival,distance=..4] if score @s tide.identifier.island = #travel_source tide.identifier.island unless data entity @s Passengers[0] run tag @s add tide.raft.ocean.available
tag @e[type=minecraft:bamboo_raft,tag=tide.raft.ocean.new] remove tide.raft.ocean.new
$execute unless entity @e[type=minecraft:bamboo_raft,tag=tide.raft.ocean.available,distance=..4] in tide:ocean positioned $(x) 0 $(z) positioned over world_surface run summon minecraft:bamboo_raft ~ ~ ~ {Tags:["tide.raft.ocean.arrival","tide.raft.ocean.new","tide.raft.ocean.available"]}
scoreboard players operation @e[type=minecraft:bamboo_raft,tag=tide.raft.ocean.new,sort=nearest,limit=1] tide.identifier.island = #travel_source tide.identifier.island
tag @e[type=minecraft:bamboo_raft,tag=tide.raft.ocean.new] remove tide.raft.ocean.new
$execute as @e[type=minecraft:bamboo_raft,tag=tide.raft.ocean.available,sort=nearest,limit=1] at @s run tp @s ~ ~ ~ $(yaw) 0

scoreboard players set #travel_teleported tide.raft.tmp 0
execute as @a[tag=tide.raft.traveler,limit=1] at @e[type=minecraft:bamboo_raft,tag=tide.raft.ocean.available,sort=nearest,limit=1] store success score #travel_teleported tide.raft.tmp run tp @s ~ ~0.5 ~
execute if score #travel_teleported tide.raft.tmp matches 1 as @a[tag=tide.raft.traveler,limit=1] at @s run ride @s mount @e[type=minecraft:bamboo_raft,tag=tide.raft.ocean.available,distance=..2,sort=nearest,limit=1]
tag @e[type=minecraft:bamboo_raft,tag=tide.raft.ocean.available] remove tide.raft.ocean.available

execute if score #travel_teleported tide.raft.tmp matches 1 as @a[tag=tide.raft.traveler,limit=1] at @s run function tide:world/location/update
execute if score #travel_teleported tide.raft.tmp matches 1 as @a[tag=tide.raft.traveler,limit=1,scores={tide.loading.state=1..2}] run function tide:runtime/loading/stop
execute if score #travel_teleported tide.raft.tmp matches 1 as @a[tag=tide.raft.traveler,limit=1] run function tide:island/raft/destination/internal/cleanup
execute if score #travel_teleported tide.raft.tmp matches 1 as @a[tag=tide.raft.traveler,limit=1] run title @s actionbar {"text":"Arrived at the Open Ocean","color":"#09C7E0"}
execute unless score #travel_teleported tide.raft.tmp matches 1 as @a[tag=tide.raft.traveler,limit=1] run title @s actionbar {"text":"The voyage could not be completed.","color":"#D94286"}
execute unless score #travel_teleported tide.raft.tmp matches 1 as @a[tag=tide.raft.traveler,limit=1] run function tide:island/raft/destination/internal/expire
tag @a remove tide.raft.traveler
return 1
