# Executed as and at a registered raft. A freestanding cover follows the raft
# without inheriting the passenger position or dimensions.
scoreboard players operation #raft_island tide.identifier.island = @s tide.identifier.island
scoreboard players set #interaction_found tide.raft.tmp 0

execute as @e[type=minecraft:interaction,tag=tide.raft.interaction,distance=..4] if score @s tide.identifier.island = #raft_island tide.identifier.island run scoreboard players set #interaction_found tide.raft.tmp 1
execute as @e[type=minecraft:interaction,tag=tide.raft.interaction,distance=..4] if score @s tide.identifier.island = #raft_island tide.identifier.island run tp @s ~ ~ ~

# Let ensure_interaction recreate a missing cover on the next tick.
execute unless score #interaction_found tide.raft.tmp matches 1 run tag @s remove tide.raft.interaction_ready
