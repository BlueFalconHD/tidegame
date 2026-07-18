scoreboard players operation #raft_island tide.identifier.island = @s tide.identifier.island
scoreboard players set #interaction_found tide.raft.tmp 0
execute as @e[type=minecraft:interaction,tag=tide.raft.interaction,distance=..4] if score @s tide.identifier.island = #raft_island tide.identifier.island run scoreboard players set #interaction_found tide.raft.tmp 1

execute if score #interaction_found tide.raft.tmp matches 1 run tag @s add tide.raft.interaction_ready
execute if score #interaction_found tide.raft.tmp matches 1 run return 1

return run function tide:island/raft/internal/create_interaction
