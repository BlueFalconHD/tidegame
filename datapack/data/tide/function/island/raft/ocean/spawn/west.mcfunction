scoreboard players set @s tide.raft.ocean.x -376
scoreboard players operation @s tide.raft.ocean.z = #ocean_edge tide.raft.tmp
scoreboard players remove @s tide.raft.ocean.z 94
scoreboard players operation @s tide.raft.ocean.z *= .ocean_chunk_size tide.raft.tmp
scoreboard players remove @s tide.raft.ocean.z 360
scoreboard players set @s tide.raft.ocean.yaw -90
return 1
