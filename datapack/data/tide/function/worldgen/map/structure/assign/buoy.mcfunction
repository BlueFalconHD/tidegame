function tide:worldgen/map/structure/assign/general
tag @s add tide.worldgen.map
tag @s add tide.worldgen.map.controller
tag @s add tide.worldgen.map.buoy
scoreboard players set @s tide.worldgen.map.dim.x 3
scoreboard players set @s tide.worldgen.map.dim.z 3
scoreboard players set @s tide.worldgen.map.pad 4
scoreboard players set @s tide.worldgen.map.type 4
data modify entity @s data set value {label:"Buoy",block:"minecraft:red_stained_glass"}
