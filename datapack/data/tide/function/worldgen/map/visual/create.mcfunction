data modify storage tide:worldgen map_visual set value {}
data modify storage tide:worldgen map_visual.label set from entity @s data.label
data modify storage tide:worldgen map_visual.block set from entity @s data.block
execute store result storage tide:worldgen map_visual.width float 0.0625 run scoreboard players get @s tide.worldgen.map.dim.x
execute store result storage tide:worldgen map_visual.depth float 0.0625 run scoreboard players get @s tide.worldgen.map.dim.z
execute at @s run function tide:worldgen/map/visual/create_block with storage tide:worldgen map_visual
execute at @s run function tide:worldgen/map/visual/create_label with storage tide:worldgen map_visual
return 1
