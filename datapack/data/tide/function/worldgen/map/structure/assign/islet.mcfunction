function tide:worldgen/map/structure/assign/general
tag @s add tide.worldgen.map.islet
scoreboard players set @s tide.worldgen.map.dim.x 102
scoreboard players set @s tide.worldgen.map.dim.z 93
scoreboard players set @s tide.worldgen.map.pad 12
scoreboard players set @s tide.worldgen.map.type 1
data modify entity @s data set value {label:"Islet",block:"minecraft:green_stained_glass"}
