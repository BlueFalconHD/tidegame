function tide:worldgen/map/structure/assign/general
tag @s add tide.worldgen.map.buried_treasure
scoreboard players set @s tide.worldgen.map.dim.x 7
scoreboard players set @s tide.worldgen.map.dim.z 7
scoreboard players set @s tide.worldgen.map.pad 4
scoreboard players set @s tide.worldgen.map.type 6
data modify entity @s data set value {label:"Buried Treasure",block:"minecraft:yellow_stained_glass"}
