function tide:worldgen/map/structure/assign/general
tag @s add tide.worldgen.map.outpost
scoreboard players set @s tide.worldgen.map.dim.x 16
scoreboard players set @s tide.worldgen.map.dim.z 16
scoreboard players set @s tide.worldgen.map.pad 8
scoreboard players set @s tide.worldgen.map.type 5
data modify entity @s data set value {label:"Outpost",block:"minecraft:orange_stained_glass"}
