scoreboard players operation #template_dim_x tide.worldgen.map.tmp = @s tide.worldgen.map.dim.x
scoreboard players operation #template_dim_z tide.worldgen.map.tmp = @s tide.worldgen.map.dim.z
execute if score @s tide.worldgen.map.rotation matches 1 run function tide:worldgen/map/structure/internal/swap_template_dimensions
execute if score @s tide.worldgen.map.rotation matches 3 run function tide:worldgen/map/structure/internal/swap_template_dimensions

scoreboard players operation #template_max_x tide.worldgen.map.tmp = @s tide.worldgen.map.place.x
scoreboard players operation #template_max_z tide.worldgen.map.tmp = @s tide.worldgen.map.place.z
scoreboard players operation #template_max_x tide.worldgen.map.tmp += #template_dim_x tide.worldgen.map.tmp
scoreboard players operation #template_max_z tide.worldgen.map.tmp += #template_dim_z tide.worldgen.map.tmp
execute if score #template_max_x tide.worldgen.map.tmp > #load_max_x tide.worldgen.map.tmp run scoreboard players operation #load_max_x tide.worldgen.map.tmp = #template_max_x tide.worldgen.map.tmp
execute if score #template_max_z tide.worldgen.map.tmp > #load_max_z tide.worldgen.map.tmp run scoreboard players operation #load_max_z tide.worldgen.map.tmp = #template_max_z tide.worldgen.map.tmp
return 1
