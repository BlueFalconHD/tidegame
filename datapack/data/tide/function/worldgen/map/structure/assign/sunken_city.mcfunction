function tide:worldgen/map/structure/assign/general
tag @s add tide.worldgen.map.sunken_city
scoreboard players set @s tide.worldgen.map.dim.x 48
scoreboard players set @s tide.worldgen.map.dim.z 48
scoreboard players set @s tide.worldgen.map.pad 8
scoreboard players set @s tide.worldgen.map.type 10
data modify entity @s data set value {label:"Sunken City",block:"minecraft:cyan_stained_glass"}
