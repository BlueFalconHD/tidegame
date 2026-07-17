execute unless entity @s[type=minecraft:marker,tag=tide.worldgen.map.controller,tag=tide.worldgen.map.accepted] run data remove storage tide:chunkload request
execute unless entity @s[type=minecraft:marker,tag=tide.worldgen.map.controller,tag=tide.worldgen.map.accepted] run return fail
execute unless score @s tide.identifier.structure matches 0.. run data remove storage tide:chunkload request
execute unless score @s tide.identifier.structure matches 0.. run return fail

scoreboard players operation #load_min_x tide.worldgen.map.tmp = @s tide.worldgen.map.rmin.x
scoreboard players operation #load_min_z tide.worldgen.map.tmp = @s tide.worldgen.map.rmin.z
scoreboard players operation #load_max_x tide.worldgen.map.tmp = @s tide.worldgen.map.rmax.x
scoreboard players operation #load_max_z tide.worldgen.map.tmp = @s tide.worldgen.map.rmax.z

# TODO, do this for all
execute if data storage tide:chunkload request.template_check if entity @s[tag=tide.worldgen.map.islet] run function tide:worldgen/map/structure/internal/include_template_check
execute if data storage tide:chunkload request.template_check if entity @s[tag=tide.worldgen.map.trawler] run function tide:worldgen/map/structure/internal/include_template_check

execute unless data storage tide:chunkload request.corner store result storage tide:chunkload request.x int 1 run scoreboard players get @s tide.worldgen.map.place.x
execute unless data storage tide:chunkload request.corner store result storage tide:chunkload request.z int 1 run scoreboard players get @s tide.worldgen.map.place.z
execute if data storage tide:chunkload request.corner store result storage tide:chunkload request.x int 1 run scoreboard players get @s tide.worldgen.map.pos.x
execute if data storage tide:chunkload request.corner store result storage tide:chunkload request.z int 1 run scoreboard players get @s tide.worldgen.map.pos.z
execute store result storage tide:chunkload request.min_x int 1 run scoreboard players get #load_min_x tide.worldgen.map.tmp
execute store result storage tide:chunkload request.min_z int 1 run scoreboard players get #load_min_z tide.worldgen.map.tmp
execute store result storage tide:chunkload request.max_x int 1 run scoreboard players get #load_max_x tide.worldgen.map.tmp
execute store result storage tide:chunkload request.max_z int 1 run scoreboard players get #load_max_z tide.worldgen.map.tmp
execute store result storage tide:chunkload request.structure_id int 1 run scoreboard players get @s tide.identifier.structure
return run function tide:runtime/chunkload/enqueue
