scoreboard players operation #swap tide.worldgen.map.tmp = @s tide.worldgen.map.dim.x
scoreboard players operation @s tide.worldgen.map.dim.x = @s tide.worldgen.map.dim.z
scoreboard players operation @s tide.worldgen.map.dim.z = #swap tide.worldgen.map.tmp
return 1
