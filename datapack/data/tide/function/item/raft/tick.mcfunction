# A used-item statistic identifies the player who placed each pending custom raft.
execute as @a[scores={tide.raft.placed=1..}] at @s run function tide:item/raft/internal/placed

scoreboard players add @e[type=minecraft:bamboo_raft,tag=tide.raft,tag=!tide.raft.registered] tide.raft.age 1
execute as @e[type=minecraft:bamboo_raft,tag=tide.raft,tag=!tide.raft.registered,scores={tide.raft.age=2..}] at @s run function tide:item/raft/internal/reject/orphaned

execute as @e[type=minecraft:bamboo_raft,tag=tide.raft.registered,tag=!tide.raft.interaction_ready] at @s run function tide:item/raft/internal/ensure_interaction
execute as @e[type=minecraft:bamboo_raft,tag=tide.raft.registered] at @s run function tide:item/raft/internal/sync_interaction

execute as @e[type=minecraft:interaction,tag=tide.raft.interaction] if data entity @s interaction run function tide:item/raft/internal/interact
execute as @e[type=minecraft:interaction,tag=tide.raft.interaction] if data entity @s attack run function tide:item/raft/internal/attack

execute as @e[type=minecraft:bamboo_raft,tag=tide.raft.registered] run data merge entity @s {Motion:[0.0d,0.0d,0.0d]}
