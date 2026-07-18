# ocean_floor resolves to Y=-29, immediately above the top sand layer at Y=-30.
# Replace the next sand block down so the chest remains concealed beneath that layer.
scoreboard players set #placed tide.worldgen.map.tmp 0
execute positioned over ocean_floor store success score #placed tide.worldgen.map.tmp run setblock ~ ~-2 ~ minecraft:chest
execute unless score #placed tide.worldgen.map.tmp matches 1 run return fail
return 1
