# world_surface resolves to Y=-1, one block above the top water block.
scoreboard players set #placed tide.worldgen.map.tmp 0
execute if score @s tide.worldgen.map.rotation matches 0 positioned over world_surface store success score #placed tide.worldgen.map.tmp run place template tide:ocean/buoy ~ ~ ~ none
execute if score @s tide.worldgen.map.rotation matches 1 positioned over world_surface store success score #placed tide.worldgen.map.tmp run place template tide:ocean/buoy ~ ~ ~ clockwise_90
execute if score @s tide.worldgen.map.rotation matches 2 positioned over world_surface store success score #placed tide.worldgen.map.tmp run place template tide:ocean/buoy ~ ~ ~ 180
execute if score @s tide.worldgen.map.rotation matches 3 positioned over world_surface store success score #placed tide.worldgen.map.tmp run place template tide:ocean/buoy ~ ~ ~ counterclockwise_90
execute unless score #placed tide.worldgen.map.tmp matches 1 run return fail
return 1
