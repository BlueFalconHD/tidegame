# The template contains its own sand footprint and rests on the ocean floor at Y=-30.
scoreboard players set #placed tide.worldgen.map.tmp 0
execute if score @s tide.worldgen.map.rotation matches 0 positioned over ocean_floor store success score #placed tide.worldgen.map.tmp run place template tide:ocean/shipwreck ~ -30 ~ none
execute if score @s tide.worldgen.map.rotation matches 1 positioned over ocean_floor store success score #placed tide.worldgen.map.tmp run place template tide:ocean/shipwreck ~ -30 ~ clockwise_90
execute if score @s tide.worldgen.map.rotation matches 2 positioned over ocean_floor store success score #placed tide.worldgen.map.tmp run place template tide:ocean/shipwreck ~ -30 ~ 180
execute if score @s tide.worldgen.map.rotation matches 3 positioned over ocean_floor store success score #placed tide.worldgen.map.tmp run place template tide:ocean/shipwreck ~ -30 ~ counterclockwise_90
execute unless score #placed tide.worldgen.map.tmp matches 1 run return fail
return 1
