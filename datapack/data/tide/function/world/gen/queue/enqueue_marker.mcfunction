execute unless entity @s[type=minecraft:marker] run return fail

scoreboard players set #prepare_ok tide.wgen 0
execute store success score #prepare_ok tide.wgen run function tide:world/gen/queue/prepare with storage tide:worldgen request
execute unless score #prepare_ok tide.wgen matches 1 run data remove storage tide:worldgen request
execute unless score #prepare_ok tide.wgen matches 1 run kill @s
execute unless score #prepare_ok tide.wgen matches 1 run return fail

scoreboard players set #origin_x tide.wgen 0
scoreboard players set #origin_y tide.wgen 0
scoreboard players set #origin_z tide.wgen 0
execute store result score #origin_x tide.wgen run data get entity @s Pos[0]
execute store result score #origin_y tide.wgen run data get entity @s Pos[1]
execute store result score #origin_z tide.wgen run data get entity @s Pos[2]

scoreboard players set #min_offset_x tide.wgen 0
scoreboard players set #min_offset_z tide.wgen 0
scoreboard players set #max_offset_x tide.wgen 0
scoreboard players set #max_offset_z tide.wgen 0
execute if data storage tide:worldgen request.min_offset_x store result score #min_offset_x tide.wgen run data get storage tide:worldgen request.min_offset_x
execute if data storage tide:worldgen request.min_offset_z store result score #min_offset_z tide.wgen run data get storage tide:worldgen request.min_offset_z
execute if data storage tide:worldgen request.max_offset_x store result score #max_offset_x tide.wgen run data get storage tide:worldgen request.max_offset_x
execute if data storage tide:worldgen request.max_offset_z store result score #max_offset_z tide.wgen run data get storage tide:worldgen request.max_offset_z

scoreboard players operation #marker_min_x tide.wgen = #origin_x tide.wgen
scoreboard players operation #marker_min_x tide.wgen += #min_offset_x tide.wgen
scoreboard players operation #marker_min_z tide.wgen = #origin_z tide.wgen
scoreboard players operation #marker_min_z tide.wgen += #min_offset_z tide.wgen
scoreboard players operation #marker_max_x tide.wgen = #origin_x tide.wgen
scoreboard players operation #marker_max_x tide.wgen += #max_offset_x tide.wgen
scoreboard players operation #marker_max_z tide.wgen = #origin_z tide.wgen
scoreboard players operation #marker_max_z tide.wgen += #max_offset_z tide.wgen

execute store result storage tide:worldgen request.x int 1 run scoreboard players get #origin_x tide.wgen
execute store result storage tide:worldgen request.y int 1 run scoreboard players get #origin_y tide.wgen
execute store result storage tide:worldgen request.z int 1 run scoreboard players get #origin_z tide.wgen
execute store result storage tide:worldgen request.min_x int 1 run scoreboard players get #marker_min_x tide.wgen
execute store result storage tide:worldgen request.min_z int 1 run scoreboard players get #marker_min_z tide.wgen
execute store result storage tide:worldgen request.max_x int 1 run scoreboard players get #marker_max_x tide.wgen
execute store result storage tide:worldgen request.max_z int 1 run scoreboard players get #marker_max_z tide.wgen
data modify storage tide:worldgen request.marker_uuid set from entity @s UUID
data remove storage tide:worldgen request.min_offset_x
data remove storage tide:worldgen request.min_offset_z
data remove storage tide:worldgen request.max_offset_x
data remove storage tide:worldgen request.max_offset_z

scoreboard players operation #min_chunk_x tide.wgen = #marker_min_x tide.wgen
scoreboard players operation #min_chunk_z tide.wgen = #marker_min_z tide.wgen
scoreboard players operation #max_chunk_x tide.wgen = #marker_max_x tide.wgen
scoreboard players operation #max_chunk_z tide.wgen = #marker_max_z tide.wgen
scoreboard players operation #min_chunk_x tide.wgen /= #sixteen tide.wgen
scoreboard players operation #min_chunk_z tide.wgen /= #sixteen tide.wgen
scoreboard players operation #max_chunk_x tide.wgen /= #sixteen tide.wgen
scoreboard players operation #max_chunk_z tide.wgen /= #sixteen tide.wgen

execute store result storage tide:worldgen request.min_chunk_x int 1 run scoreboard players get #min_chunk_x tide.wgen
execute store result storage tide:worldgen request.min_chunk_z int 1 run scoreboard players get #min_chunk_z tide.wgen
execute store result storage tide:worldgen request.max_chunk_x int 1 run scoreboard players get #max_chunk_x tide.wgen
execute store result storage tide:worldgen request.max_chunk_z int 1 run scoreboard players get #max_chunk_z tide.wgen

data modify storage tide:worldgen queue append from storage tide:worldgen request
data remove storage tide:worldgen request
return 1
