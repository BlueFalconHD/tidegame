function tide:worldgen/map/structure/assign/general
tag @s add tide.worldgen.map.abandoned_raft
scoreboard players set @s tide.worldgen.map.dim.x 5
scoreboard players set @s tide.worldgen.map.dim.z 6
scoreboard players set @s tide.worldgen.map.pad 4
scoreboard players set @s tide.worldgen.map.type 3
data modify entity @s data set value {label:"Abandoned Raft",block:"minecraft:magenta_stained_glass"}
