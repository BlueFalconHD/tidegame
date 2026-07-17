# Clear first so template blocks retain their saved waterlogged states instead
# of inheriting the fluid that occupied each destination block.
execute if score @s tide.worldgen.map.rotation matches 0 run fill ~ ~ ~ ~12 ~28 ~38 minecraft:air
execute if score @s tide.worldgen.map.rotation matches 1 run fill ~-38 ~ ~ ~ ~28 ~12 minecraft:air
execute if score @s tide.worldgen.map.rotation matches 2 run fill ~-12 ~ ~-38 ~ ~28 ~ minecraft:air
execute if score @s tide.worldgen.map.rotation matches 3 run fill ~ ~ ~-12 ~38 ~28 ~ minecraft:air

execute if score @s tide.worldgen.map.rotation matches 0 run return run place template tide:ocean/ghost_ship ~ ~ ~ none
execute if score @s tide.worldgen.map.rotation matches 1 run return run place template tide:ocean/ghost_ship ~ ~ ~ clockwise_90
execute if score @s tide.worldgen.map.rotation matches 2 run return run place template tide:ocean/ghost_ship ~ ~ ~ 180
execute if score @s tide.worldgen.map.rotation matches 3 run return run place template tide:ocean/ghost_ship ~ ~ ~ counterclockwise_90
return fail
