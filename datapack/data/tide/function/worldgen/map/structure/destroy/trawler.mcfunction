execute if score @s tide.worldgen.map.rotation matches 0 run return run function tide:worldgen/map/structure/destroy/trawler/unrotated
execute if score @s tide.worldgen.map.rotation matches 2 run return run function tide:worldgen/map/structure/destroy/trawler/unrotated
execute if score @s tide.worldgen.map.rotation matches 1 run return run function tide:worldgen/map/structure/destroy/trawler/rotated
execute if score @s tide.worldgen.map.rotation matches 3 run return run function tide:worldgen/map/structure/destroy/trawler/rotated
return fail
