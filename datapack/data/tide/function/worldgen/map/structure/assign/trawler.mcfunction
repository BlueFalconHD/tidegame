function tide:worldgen/map/structure/assign/general
tag @s add tide.worldgen.map.trawler
scoreboard players set @s tide.worldgen.map.dim.x 7
scoreboard players set @s tide.worldgen.map.dim.z 16
scoreboard players set @s tide.worldgen.map.pad 6
scoreboard players set @s tide.worldgen.map.type 2
data modify entity @s data set value {label:"Trawler",block:"minecraft:pink_stained_glass"}
