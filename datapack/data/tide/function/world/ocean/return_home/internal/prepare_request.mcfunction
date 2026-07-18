data modify storage tide:chunkload request set value {dimension:"minecraft:overworld",callback:"tide:world/ocean/return_home/ready",kind:"open_ocean_to_home_raft",x:0,y:0,z:0,min_x:0,min_z:0,max_x:0,max_z:0,traveler:0,island:0}
execute store result storage tide:chunkload request.x int 1 run scoreboard players get @s tide.raft.x
execute store result storage tide:chunkload request.y int 1 run scoreboard players get @s tide.raft.y
execute store result storage tide:chunkload request.z int 1 run scoreboard players get @s tide.raft.z
execute store result storage tide:chunkload request.min_x int 1 run scoreboard players get @s tide.raft.x
execute store result storage tide:chunkload request.min_z int 1 run scoreboard players get @s tide.raft.z
execute store result storage tide:chunkload request.max_x int 1 run scoreboard players get @s tide.raft.x
execute store result storage tide:chunkload request.max_z int 1 run scoreboard players get @s tide.raft.z
execute store result storage tide:chunkload request.traveler int 1 run scoreboard players get #ocean_return_player tide.identifier.player
execute store result storage tide:chunkload request.island int 1 run scoreboard players get @s tide.identifier.island
scoreboard players set #ocean_return_available tide.location.tmp 1
return 1
