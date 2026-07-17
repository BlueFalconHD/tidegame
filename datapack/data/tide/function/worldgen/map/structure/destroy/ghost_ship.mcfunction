execute if score @s tide.worldgen.map.rotation matches 0 run return run function tide:worldgen/map/structure/destroy/ghost_ship/unrotated
execute if score @s tide.worldgen.map.rotation matches 2 run return run function tide:worldgen/map/structure/destroy/ghost_ship/unrotated
execute if score @s tide.worldgen.map.rotation matches 1 run return run function tide:worldgen/map/structure/destroy/ghost_ship/rotated
execute if score @s tide.worldgen.map.rotation matches 3 run return run function tide:worldgen/map/structure/destroy/ghost_ship/rotated
return fail
