$scoreboard players set #ocean_return_player tide.identifier.player $(traveler)
$scoreboard players set #ocean_return_island tide.identifier.island $(island)

tag @a remove tide.ocean.return.traveler
execute as @a[tag=tide.ocean.return.pending] if score @s tide.identifier.player = #ocean_return_player tide.identifier.player run tag @s add tide.ocean.return.traveler
# A timed-out request may finish after the player has begun another transition.
execute unless entity @a[tag=tide.ocean.return.traveler] run return 1

scoreboard players set #ocean_return_available tide.location.tmp 0
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry,tag=!tide.island.destroying] if score @s tide.identifier.island = #ocean_return_island tide.identifier.island if score @s tide.island.state matches 2 if score @s tide.raft.state matches 1 run scoreboard players set #ocean_return_available tide.location.tmp 1
execute unless score #ocean_return_available tide.location.tmp matches 1 as @a[tag=tide.ocean.return.traveler,limit=1] run function tide:world/ocean/return_home/fallback
execute unless score #ocean_return_available tide.location.tmp matches 1 run tag @a remove tide.ocean.return.traveler
execute unless score #ocean_return_available tide.location.tmp matches 1 run return 1

tag @e[type=minecraft:bamboo_raft,tag=tide.ocean.return.raft] remove tide.ocean.return.raft
execute as @e[type=minecraft:bamboo_raft,tag=tide.raft.registered,distance=..4] if score @s tide.identifier.island = #ocean_return_island tide.identifier.island run tag @s add tide.ocean.return.raft
execute unless entity @e[type=minecraft:bamboo_raft,tag=tide.ocean.return.raft,sort=nearest,limit=1] as @a[tag=tide.ocean.return.traveler,limit=1] run function tide:world/ocean/return_home/fallback
execute unless entity @e[type=minecraft:bamboo_raft,tag=tide.ocean.return.raft,sort=nearest,limit=1] run tag @a remove tide.ocean.return.traveler
execute unless entity @e[type=minecraft:bamboo_raft,tag=tide.ocean.return.raft,sort=nearest,limit=1] run return 1

ride @a[tag=tide.ocean.return.traveler,limit=1] dismount
scoreboard players set #ocean_return_teleported tide.location.tmp 0
execute as @a[tag=tide.ocean.return.traveler,limit=1] at @e[type=minecraft:bamboo_raft,tag=tide.ocean.return.raft,sort=nearest,limit=1] store success score #ocean_return_teleported tide.location.tmp run tp @s ~ ~0.8 ~
tag @e[type=minecraft:bamboo_raft,tag=tide.ocean.return.raft] remove tide.ocean.return.raft

execute if score #ocean_return_teleported tide.location.tmp matches 1 as @a[tag=tide.ocean.return.traveler,limit=1] at @s run function tide:world/location/update
execute if score #ocean_return_teleported tide.location.tmp matches 1 as @a[tag=tide.ocean.return.traveler,limit=1] run tag @s remove tide.ocean.return.pending
execute if score #ocean_return_teleported tide.location.tmp matches 1 as @a[tag=tide.ocean.return.traveler,limit=1] run tag @s add tide.ocean.return.settling
execute if score #ocean_return_teleported tide.location.tmp matches 1 as @a[tag=tide.ocean.return.traveler,limit=1] run scoreboard players set @s tide.area_transition 10
execute unless score #ocean_return_teleported tide.location.tmp matches 1 as @a[tag=tide.ocean.return.traveler,limit=1] run function tide:world/ocean/return_home/fallback
tag @a remove tide.ocean.return.traveler
return 1
