execute unless score @s tide.raft.state matches 1 run return fail

data modify storage tide:chunkload request set value {dimension:"minecraft:overworld",callback:"tide:item/raft/repair/ready",kind:"island_raft_repair"}
execute store result storage tide:chunkload request.island_id int 1 run scoreboard players get #repair_island tide.identifier.island
execute store result storage tide:chunkload request.player_id int 1 run scoreboard players get #repair_player tide.identifier.player
execute store result storage tide:chunkload request.x int 1 run scoreboard players get @s tide.raft.x
execute store result storage tide:chunkload request.y int 1 run scoreboard players get @s tide.raft.y
execute store result storage tide:chunkload request.z int 1 run scoreboard players get @s tide.raft.z
execute store result storage tide:chunkload request.min_x int 1 run scoreboard players get @s tide.raft.x
execute store result storage tide:chunkload request.min_z int 1 run scoreboard players get @s tide.raft.z
execute store result storage tide:chunkload request.max_x int 1 run scoreboard players get @s tide.raft.x
execute store result storage tide:chunkload request.max_z int 1 run scoreboard players get @s tide.raft.z

return 1
