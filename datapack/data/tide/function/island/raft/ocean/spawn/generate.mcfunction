# The 47 x 47 ocean has 184 unique perimeter chunks.
execute store result score #ocean_edge tide.raft.tmp run random value 0..183
execute store result score #ocean_offset_x tide.raft.tmp run random value 0..15
execute store result score #ocean_offset_z tide.raft.tmp run random value 0..15

execute if score #ocean_edge tide.raft.tmp matches 0..46 run function tide:island/raft/ocean/spawn/north
execute if score #ocean_edge tide.raft.tmp matches 47..93 run function tide:island/raft/ocean/spawn/south
execute if score #ocean_edge tide.raft.tmp matches 94..138 run function tide:island/raft/ocean/spawn/west
execute if score #ocean_edge tide.raft.tmp matches 139..183 run function tide:island/raft/ocean/spawn/east

scoreboard players operation @s tide.raft.ocean.x += #ocean_offset_x tide.raft.tmp
scoreboard players operation @s tide.raft.ocean.z += #ocean_offset_z tide.raft.tmp
tag @s add tide.raft.ocean.ready
return 1
