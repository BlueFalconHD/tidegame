scoreboard players set #valid tide.worldgen.map.tmp 1
execute unless score @s tide.worldgen.map.rmin.x >= #map_min tide.worldgen.map.tmp run scoreboard players set #valid tide.worldgen.map.tmp 0
execute unless score @s tide.worldgen.map.rmax.x <= #map_max tide.worldgen.map.tmp run scoreboard players set #valid tide.worldgen.map.tmp 0
execute unless score @s tide.worldgen.map.rmin.z >= #map_min tide.worldgen.map.tmp run scoreboard players set #valid tide.worldgen.map.tmp 0
execute unless score @s tide.worldgen.map.rmax.z <= #map_max tide.worldgen.map.tmp run scoreboard players set #valid tide.worldgen.map.tmp 0

scoreboard players operation #candidate tide.worldgen.map.rmin.x = @s tide.worldgen.map.rmin.x
scoreboard players operation #candidate tide.worldgen.map.rmax.x = @s tide.worldgen.map.rmax.x
scoreboard players operation #candidate tide.worldgen.map.rmin.z = @s tide.worldgen.map.rmin.z
scoreboard players operation #candidate tide.worldgen.map.rmax.z = @s tide.worldgen.map.rmax.z
scoreboard players set #collision tide.worldgen.map.tmp 0
execute as @e[type=minecraft:marker,tag=tide.worldgen.map.controller,tag=tide.worldgen.map.accepted] if score @s tide.worldgen.map.rmax.x >= #candidate tide.worldgen.map.rmin.x if score @s tide.worldgen.map.rmin.x <= #candidate tide.worldgen.map.rmax.x if score @s tide.worldgen.map.rmax.z >= #candidate tide.worldgen.map.rmin.z if score @s tide.worldgen.map.rmin.z <= #candidate tide.worldgen.map.rmax.z run scoreboard players set #collision tide.worldgen.map.tmp 1
execute if score #collision tide.worldgen.map.tmp matches 1 run scoreboard players set #valid tide.worldgen.map.tmp 0

execute if entity @s[tag=tide.worldgen.map.islet] run function tide:worldgen/map/layout/candidate/spacing/islet
execute if entity @s[tag=tide.worldgen.map.ghost_ship] run function tide:worldgen/map/layout/candidate/spacing/ghost_ship
return 1
