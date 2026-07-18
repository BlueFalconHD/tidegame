# The template spans the ocean floor at Y=-30 through the top water block at Y=-2.
scoreboard players set #placed tide.worldgen.map.tmp 0
execute if score @s tide.worldgen.map.rotation matches 0 positioned over ocean_floor store success score #placed tide.worldgen.map.tmp run place template tide:ocean/reef ~ -30 ~ none
execute if score @s tide.worldgen.map.rotation matches 1 positioned over ocean_floor store success score #placed tide.worldgen.map.tmp run place template tide:ocean/reef ~ -30 ~ clockwise_90
execute if score @s tide.worldgen.map.rotation matches 2 positioned over ocean_floor store success score #placed tide.worldgen.map.tmp run place template tide:ocean/reef ~ -30 ~ 180
execute if score @s tide.worldgen.map.rotation matches 3 positioned over ocean_floor store success score #placed tide.worldgen.map.tmp run place template tide:ocean/reef ~ -30 ~ counterclockwise_90
execute unless score #placed tide.worldgen.map.tmp matches 1 run return fail
return 1
