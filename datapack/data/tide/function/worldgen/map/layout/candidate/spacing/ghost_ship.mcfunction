# Require at least 48 ocean blocks between the exact footprints of two pirate ships.
scoreboard players set #minimum_gap tide.worldgen.map.tmp 48

scoreboard players operation #spacing tide.worldgen.map.min.x = @s tide.worldgen.map.min.x
scoreboard players operation #spacing tide.worldgen.map.min.x -= #minimum_gap tide.worldgen.map.tmp
scoreboard players operation #spacing tide.worldgen.map.max.x = @s tide.worldgen.map.max.x
scoreboard players operation #spacing tide.worldgen.map.max.x += #minimum_gap tide.worldgen.map.tmp
scoreboard players operation #spacing tide.worldgen.map.min.z = @s tide.worldgen.map.min.z
scoreboard players operation #spacing tide.worldgen.map.min.z -= #minimum_gap tide.worldgen.map.tmp
scoreboard players operation #spacing tide.worldgen.map.max.z = @s tide.worldgen.map.max.z
scoreboard players operation #spacing tide.worldgen.map.max.z += #minimum_gap tide.worldgen.map.tmp

scoreboard players set #too_close tide.worldgen.map.tmp 0
execute as @e[type=minecraft:marker,tag=tide.worldgen.map.controller,tag=tide.worldgen.map.accepted,tag=tide.worldgen.map.ghost_ship] if score @s tide.worldgen.map.max.x >= #spacing tide.worldgen.map.min.x if score @s tide.worldgen.map.min.x <= #spacing tide.worldgen.map.max.x if score @s tide.worldgen.map.max.z >= #spacing tide.worldgen.map.min.z if score @s tide.worldgen.map.min.z <= #spacing tide.worldgen.map.max.z run scoreboard players set #too_close tide.worldgen.map.tmp 1
execute if score #too_close tide.worldgen.map.tmp matches 1 run scoreboard players set #valid tide.worldgen.map.tmp 0
return 1
