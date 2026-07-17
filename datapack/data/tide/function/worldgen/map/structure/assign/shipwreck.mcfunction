function tide:worldgen/map/structure/assign/general
tag @s add tide.worldgen.map.shipwreck
scoreboard players set @s tide.worldgen.map.dim.x 13
scoreboard players set @s tide.worldgen.map.dim.z 15
scoreboard players set @s tide.worldgen.map.pad 6
scoreboard players set @s tide.worldgen.map.type 9
data modify entity @s data set value {label:"Shipwreck",block:"minecraft:brown_stained_glass"}
