scoreboard players operation @s tide.worldgen.map.min.x = @s tide.worldgen.map.pos.x
scoreboard players operation @s tide.worldgen.map.max.x = @s tide.worldgen.map.pos.x
scoreboard players operation @s tide.worldgen.map.max.x += @s tide.worldgen.map.dim.x
scoreboard players remove @s tide.worldgen.map.max.x 1

scoreboard players operation @s tide.worldgen.map.min.z = @s tide.worldgen.map.pos.z
scoreboard players operation @s tide.worldgen.map.max.z = @s tide.worldgen.map.pos.z
scoreboard players operation @s tide.worldgen.map.max.z += @s tide.worldgen.map.dim.z
scoreboard players remove @s tide.worldgen.map.max.z 1

function tide:worldgen/map/layout/candidate/calculate_placement_anchor

scoreboard players operation @s tide.worldgen.map.rmin.x = @s tide.worldgen.map.min.x
scoreboard players operation @s tide.worldgen.map.rmin.x -= @s tide.worldgen.map.pad
scoreboard players operation @s tide.worldgen.map.rmax.x = @s tide.worldgen.map.max.x
scoreboard players operation @s tide.worldgen.map.rmax.x += @s tide.worldgen.map.pad
scoreboard players operation @s tide.worldgen.map.rmin.z = @s tide.worldgen.map.min.z
scoreboard players operation @s tide.worldgen.map.rmin.z -= @s tide.worldgen.map.pad
scoreboard players operation @s tide.worldgen.map.rmax.z = @s tide.worldgen.map.max.z
scoreboard players operation @s tide.worldgen.map.rmax.z += @s tide.worldgen.map.pad
return 1
