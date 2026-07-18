# The runtime invokes this at the registered raft position after its chunk is loaded.
scoreboard players set #repair_island tide.identifier.island -1
execute store result score #repair_island tide.identifier.island run data get storage tide:chunkload active.island_id
scoreboard players set #repair_player tide.identifier.player -1
execute store result score #repair_player tide.identifier.player run data get storage tide:chunkload active.player_id

tag @e[type=minecraft:bamboo_raft,tag=tide.raft.repair_target] remove tide.raft.repair_target
execute as @e[type=minecraft:bamboo_raft,tag=tide.raft.registered,distance=..4,sort=nearest,limit=1] if score @s tide.identifier.island = #repair_island tide.identifier.island run tag @s add tide.raft.repair_target

scoreboard players set #repair_raft_found tide.raft.tmp 0
execute if entity @e[type=minecraft:bamboo_raft,tag=tide.raft.repair_target,limit=1] run scoreboard players set #repair_raft_found tide.raft.tmp 1

# If the raft survived but its cover did not, restore only the interaction entity.
scoreboard players set #repair_interaction_found tide.raft.tmp 0
execute if score #repair_raft_found tide.raft.tmp matches 1 as @e[type=minecraft:interaction,tag=tide.raft.interaction,distance=..4] if score @s tide.identifier.island = #repair_island tide.identifier.island run scoreboard players set #repair_interaction_found tide.raft.tmp 1
execute if score #repair_interaction_found tide.raft.tmp matches 1 as @e[type=minecraft:bamboo_raft,tag=tide.raft.repair_target,limit=1] at @s run function tide:island/raft/internal/ensure_interaction

scoreboard players set #repair_interaction_created tide.raft.tmp 0
execute if score #repair_raft_found tide.raft.tmp matches 1 unless score #repair_interaction_found tide.raft.tmp matches 1 as @e[type=minecraft:interaction,tag=tide.raft.interaction,distance=..4] if score @s tide.identifier.island = #repair_island tide.identifier.island run kill @s
execute if score #repair_raft_found tide.raft.tmp matches 1 unless score #repair_interaction_found tide.raft.tmp matches 1 as @e[type=minecraft:bamboo_raft,tag=tide.raft.repair_target,limit=1] at @s store result score #repair_interaction_created tide.raft.tmp run function tide:island/raft/internal/create_interaction

execute if score #repair_raft_found tide.raft.tmp matches 1 if score #repair_interaction_found tide.raft.tmp matches 1 as @a if score @s tide.identifier.player = #repair_player tide.identifier.player run tellraw @s {"text":"Raft is already healthy.","color":"#E0CA8E"}
execute if score #repair_raft_found tide.raft.tmp matches 1 if score #repair_interaction_created tide.raft.tmp matches 1 as @a if score @s tide.identifier.player = #repair_player tide.identifier.player run tellraw @s {"text":"Raft interaction repaired.","color":"#E0CA8E"}
execute if score #repair_raft_found tide.raft.tmp matches 1 unless score #repair_interaction_found tide.raft.tmp matches 1 unless score #repair_interaction_created tide.raft.tmp matches 1 as @a if score @s tide.identifier.player = #repair_player tide.identifier.player run tellraw @s {"text":"Unable to repair the raft interaction.","color":"#D94286"}
execute if score #repair_raft_found tide.raft.tmp matches 1 unless score #repair_interaction_found tide.raft.tmp matches 1 unless score #repair_interaction_created tide.raft.tmp matches 1 run tag @e[type=minecraft:bamboo_raft,tag=tide.raft.repair_target,limit=1] remove tide.raft.repair_target
execute if score #repair_raft_found tide.raft.tmp matches 1 unless score #repair_interaction_found tide.raft.tmp matches 1 unless score #repair_interaction_created tide.raft.tmp matches 1 run return fail

# if raft cannot be found set state to none
execute unless score #repair_raft_found tide.raft.tmp matches 1 as @e[type=minecraft:interaction,tag=tide.raft.interaction,distance=..4] if score @s tide.identifier.island = #repair_island tide.identifier.island run kill @s
execute unless score #repair_raft_found tide.raft.tmp matches 1 in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry] if score @s tide.identifier.island = #repair_island tide.identifier.island run function tide:island/raft/internal/unregister_island

scoreboard players set #repair_player_online tide.raft.tmp 0
execute as @a if score @s tide.identifier.player = #repair_player tide.identifier.player run scoreboard players set #repair_player_online tide.raft.tmp 1
execute unless score #repair_raft_found tide.raft.tmp matches 1 if score #repair_player_online tide.raft.tmp matches 1 as @a if score @s tide.identifier.player = #repair_player tide.identifier.player at @s run loot spawn ~ ~ ~ loot tide:island/raft
execute unless score #repair_raft_found tide.raft.tmp matches 1 unless score #repair_player_online tide.raft.tmp matches 1 run loot spawn ~ ~ ~ loot tide:island/raft
execute unless score #repair_raft_found tide.raft.tmp matches 1 as @a if score @s tide.identifier.player = #repair_player tide.identifier.player run tellraw @s {"text":"Stale raft state cleared. A replacement raft was returned.","color":"#E0CA8E"}

tag @e[type=minecraft:bamboo_raft,tag=tide.raft.repair_target] remove tide.raft.repair_target
return 1
