# Place the saved island template at the ocean floor.
scoreboard players set #placed tide.worldgen.map.tmp 0
execute if score @s tide.worldgen.map.rotation matches 0 positioned over ocean_floor store success score #placed tide.worldgen.map.tmp run place template tide:ocean/island ~ ~ ~ none
execute if score @s tide.worldgen.map.rotation matches 1 positioned over ocean_floor store success score #placed tide.worldgen.map.tmp run place template tide:ocean/island ~ ~ ~ clockwise_90
execute if score @s tide.worldgen.map.rotation matches 2 positioned over ocean_floor store success score #placed tide.worldgen.map.tmp run place template tide:ocean/island ~ ~ ~ 180
execute if score @s tide.worldgen.map.rotation matches 3 positioned over ocean_floor store success score #placed tide.worldgen.map.tmp run place template tide:ocean/island ~ ~ ~ counterclockwise_90
execute unless score #placed tide.worldgen.map.tmp matches 1 run return fail
return 1
