execute unless entity @s[tag=tide.raft.ocean.ready] run function tide:island/raft/ocean/spawn/generate
execute unless score @s tide.raft.ocean.yaw matches -2147483648..2147483647 run function tide:island/raft/ocean/spawn/restore_yaw

data modify storage tide:chunkload request set value {dimension:"tide:ocean",callback:"tide:island/raft/ocean/ready",kind:"raft_to_open_ocean",x:0,y:0,z:0,yaw:0,min_x:0,min_z:0,max_x:0,max_z:0,traveler:0,island:0}
execute store result storage tide:chunkload request.x int 1 run scoreboard players get @s tide.raft.ocean.x
execute store result storage tide:chunkload request.z int 1 run scoreboard players get @s tide.raft.ocean.z
execute store result storage tide:chunkload request.yaw int 1 run scoreboard players get @s tide.raft.ocean.yaw
execute store result storage tide:chunkload request.min_x int 1 run scoreboard players get @s tide.raft.ocean.x
execute store result storage tide:chunkload request.min_z int 1 run scoreboard players get @s tide.raft.ocean.z
execute store result storage tide:chunkload request.max_x int 1 run scoreboard players get @s tide.raft.ocean.x
execute store result storage tide:chunkload request.max_z int 1 run scoreboard players get @s tide.raft.ocean.z
execute store result storage tide:chunkload request.traveler int 1 run scoreboard players get #travel_player tide.identifier.player
execute store result storage tide:chunkload request.island int 1 run scoreboard players get @s tide.identifier.island
scoreboard players set #travel_available tide.raft.tmp 1
return 1
