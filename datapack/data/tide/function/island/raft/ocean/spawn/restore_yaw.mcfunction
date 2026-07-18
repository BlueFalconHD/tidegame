# Upgrade persistent entry points created before their inward yaw was stored.
scoreboard players set @s tide.raft.ocean.yaw 0
execute if score @s tide.raft.ocean.x matches -376..-361 run scoreboard players set @s tide.raft.ocean.yaw -90
execute if score @s tide.raft.ocean.x matches 360..375 run scoreboard players set @s tide.raft.ocean.yaw 90
execute if score @s tide.raft.ocean.z matches -376..-361 run scoreboard players set @s tide.raft.ocean.yaw 0
execute if score @s tide.raft.ocean.z matches 360..375 run scoreboard players set @s tide.raft.ocean.yaw 180
return 1
