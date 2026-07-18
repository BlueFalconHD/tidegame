function tide:worldgen/map/structure/assign/general
tag @s add tide.worldgen.map.reef
scoreboard players set @s tide.worldgen.map.dim.x 32
scoreboard players set @s tide.worldgen.map.dim.z 33
scoreboard players set @s tide.worldgen.map.pad 6
scoreboard players set @s tide.worldgen.map.type 7
data modify entity @s data set value {label:"Reef",block:"minecraft:lime_stained_glass"}
