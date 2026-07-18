# A used-item statistic identifies the player who placed each pending custom raft.
execute as @a[scores={tide.raft.placed=1..}] at @s run function tide:island/raft/internal/placed

# A travel session never survives disconnecting from the server.
scoreboard players add @a tide.raft.leaves 0
execute as @a unless score @s tide.raft.seen_leaves = @s tide.raft.leaves run function tide:island/raft/destination/internal/expire
execute as @a unless score @s tide.raft.seen_leaves = @s tide.raft.leaves run scoreboard players operation @s tide.raft.seen_leaves = @s tide.raft.leaves

scoreboard players add @e[type=minecraft:bamboo_raft,tag=tide.raft,tag=!tide.raft.registered] tide.raft.age 1
execute as @e[type=minecraft:bamboo_raft,tag=tide.raft,tag=!tide.raft.registered,scores={tide.raft.age=2..}] at @s run function tide:island/raft/internal/reject/orphaned

execute as @e[type=minecraft:bamboo_raft,tag=tide.raft.registered,tag=!tide.raft.interaction_ready] at @s run function tide:island/raft/internal/ensure_interaction

execute as @e[type=minecraft:bamboo_raft,tag=tide.raft.registered] at @s run function tide:island/raft/internal/sync_interaction

execute as @e[type=minecraft:interaction,tag=tide.raft.interaction] if data entity @s interaction run function tide:island/raft/internal/interact

execute as @e[type=minecraft:interaction,tag=tide.raft.interaction] if data entity @s attack run function tide:island/raft/internal/attack

execute as @a[tag=tide.raft.travel.session,scores={tide.raft.travel=..-1}] run function tide:island/raft/destination/internal/expire
execute as @a[tag=tide.raft.travel.session,scores={tide.raft.travel=1..}] run function tide:island/raft/destination/select
scoreboard players add @a[tag=tide.raft.travel.session] tide.raft.travel.age 1
execute as @a[tag=tide.raft.travel.session,scores={tide.raft.travel.age=1201..}] run function tide:island/raft/destination/internal/expire
scoreboard players enable @a[tag=tide.raft.travel.session] tide.raft.travel
execute as @a[tag=tide.raft.travel.departing,scores={tide.loading.state=2,tide.raft.destination=0..}] run function tide:island/raft/destination/depart
execute as @a[tag=tide.raft.travel.departing,scores={tide.loading.state=2,tide.raft.destination=-1,tide.raft.travel.age=60..}] run function tide:island/raft/ocean/depart
scoreboard players add @a[tag=tide.raft.travel.departing] tide.raft.travel.age 1
scoreboard players add @a[tag=tide.raft.travel.pending] tide.raft.travel.age 1
execute as @a[tag=tide.raft.travel.departing,scores={tide.raft.travel.age=6001..}] run function tide:island/raft/destination/internal/timeout
execute as @a[tag=tide.raft.travel.pending,scores={tide.raft.travel.age=6001..}] run function tide:island/raft/destination/internal/timeout

execute as @e[type=minecraft:bamboo_raft,tag=tide.raft.registered] run data merge entity @s {Motion:[0.0d,0.0d,0.0d]}
