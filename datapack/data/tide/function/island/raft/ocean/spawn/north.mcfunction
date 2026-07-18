scoreboard players operation @s tide.raft.ocean.x = #ocean_edge tide.raft.tmp
scoreboard players operation @s tide.raft.ocean.x *= .ocean_chunk_size tide.raft.tmp
scoreboard players remove @s tide.raft.ocean.x 376
scoreboard players set @s tide.raft.ocean.z -376
scoreboard players set @s tide.raft.ocean.yaw 0
return 1
