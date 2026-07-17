# Keep pos.x/z at the minimum corner while offsetting the template origin for rotation.
scoreboard players operation @s tide.worldgen.map.place.x = @s tide.worldgen.map.pos.x
scoreboard players operation @s tide.worldgen.map.place.z = @s tide.worldgen.map.pos.z
execute if score @s tide.worldgen.map.rotation matches 1..2 run scoreboard players operation @s tide.worldgen.map.place.x = @s tide.worldgen.map.max.x
execute if score @s tide.worldgen.map.rotation matches 2..3 run scoreboard players operation @s tide.worldgen.map.place.z = @s tide.worldgen.map.max.z
return 1
