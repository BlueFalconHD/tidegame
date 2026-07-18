tag @s add tide.island.destroying

data modify storage tide:chunkload request set value {dimension:"minecraft:overworld",callback:"tide:island/destroy/ready",kind:"destroy_player_island",x:0,y:0,z:0,min_x:0,min_z:0,max_x:0,max_z:0,island:0,owner:0}
execute store result storage tide:chunkload request.x int 1 run scoreboard players get @s tide.island.x
execute store result storage tide:chunkload request.y int 1 run scoreboard players get @s tide.island.y
execute store result storage tide:chunkload request.z int 1 run scoreboard players get @s tide.island.z
execute store result storage tide:chunkload request.min_x int 1 run scoreboard players get @s tide.island.x
execute store result storage tide:chunkload request.min_z int 1 run scoreboard players get @s tide.island.z
execute store result storage tide:chunkload request.island int 1 run scoreboard players get @s tide.identifier.island
execute store result storage tide:chunkload request.owner int 1 run scoreboard players get @s tide.island.owner

scoreboard players operation #destroy_max_x tide.island.tmp = @s tide.island.x
scoreboard players operation #destroy_max_z tide.island.tmp = @s tide.island.z
scoreboard players add #destroy_max_x tide.island.tmp 127
scoreboard players add #destroy_max_z tide.island.tmp 127
execute store result storage tide:chunkload request.max_x int 1 run scoreboard players get #destroy_max_x tide.island.tmp
execute store result storage tide:chunkload request.max_z int 1 run scoreboard players get #destroy_max_z tide.island.tmp

scoreboard players set #destroy_request_enqueued tide.island.tmp 0
execute store result score #destroy_request_enqueued tide.island.tmp run function tide:runtime/chunkload/enqueue
execute unless score #destroy_request_enqueued tide.island.tmp matches 1 run tag @s remove tide.island.destroying
return run scoreboard players get #destroy_request_enqueued tide.island.tmp
