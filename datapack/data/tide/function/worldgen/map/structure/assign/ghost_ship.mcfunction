function tide:worldgen/map/structure/assign/general
tag @s add tide.worldgen.map.ghost_ship
scoreboard players set @s tide.worldgen.map.dim.x 24
scoreboard players set @s tide.worldgen.map.dim.z 40
scoreboard players set @s tide.worldgen.map.pad 8
scoreboard players set @s tide.worldgen.map.type 8
data modify entity @s data set value {label:"Ghost Ship",block:"minecraft:purple_stained_glass"}
