execute unless entity @s[type=minecraft:marker,tag=tide.island.registry] run return fail
execute unless score @s tide.island.state matches 0 unless score @s tide.island.state matches 3 run return fail

scoreboard players set @s tide.island.state 1

data modify storage tide:chunkload request set value {dimension:"minecraft:overworld",callback:"tide:worldgen/island/build/ready",kind:"player_island"}
execute store result storage tide:chunkload request.island_id int 1 run scoreboard players get @s tide.identifier.island
execute store result storage tide:chunkload request.x int 1 run scoreboard players get @s tide.island.x
execute store result storage tide:chunkload request.y int 1 run scoreboard players get @s tide.island.y
execute store result storage tide:chunkload request.z int 1 run scoreboard players get @s tide.island.z
execute store result storage tide:chunkload request.min_x int 1 run scoreboard players get @s tide.island.x
execute store result storage tide:chunkload request.min_z int 1 run scoreboard players get @s tide.island.z

scoreboard players operation #max_x tide.island.tmp = @s tide.island.x
scoreboard players operation #max_z tide.island.tmp = @s tide.island.z
scoreboard players add #max_x tide.island.tmp 127
scoreboard players add #max_z tide.island.tmp 127
execute store result storage tide:chunkload request.max_x int 1 run scoreboard players get #max_x tide.island.tmp
execute store result storage tide:chunkload request.max_z int 1 run scoreboard players get #max_z tide.island.tmp

scoreboard players set #enqueued tide.island.tmp 0
execute store result score #enqueued tide.island.tmp run function tide:runtime/chunkload/enqueue
execute unless score #enqueued tide.island.tmp matches 1 run scoreboard players set @s tide.island.state 3

return run scoreboard players get #enqueued tide.island.tmp
