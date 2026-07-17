execute if score @s tide.worldgen.map.rotation matches 0 run return run function tide:worldgen/map/structure/destroy/abandoned_raft/unrotated
execute if score @s tide.worldgen.map.rotation matches 2 run return run function tide:worldgen/map/structure/destroy/abandoned_raft/unrotated
execute if score @s tide.worldgen.map.rotation matches 1 run return run function tide:worldgen/map/structure/destroy/abandoned_raft/rotated
execute if score @s tide.worldgen.map.rotation matches 3 run return run function tide:worldgen/map/structure/destroy/abandoned_raft/rotated
return fail
