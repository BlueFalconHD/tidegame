# The template's local water surface is Y=4. Place its origin at Y=-6 so
# that surface matches the ocean's highest water blocks at Y=-2.
scoreboard players set #placed tide.worldgen.map.tmp 0
execute positioned over world_surface positioned ~ ~-5 ~ store success score #placed tide.worldgen.map.tmp run function tide:worldgen/map/structure/build/ghost_ship/place
execute unless score #placed tide.worldgen.map.tmp matches 1 run return fail
return 1
