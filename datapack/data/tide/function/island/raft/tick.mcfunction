# A travel session never survives disconnecting from the server.
scoreboard players add @a tide.raft.leaves 0
execute as @a unless score @s tide.raft.seen_leaves = @s tide.raft.leaves run function tide:island/raft/destination/internal/expire
execute as @a unless score @s tide.raft.seen_leaves = @s tide.raft.leaves run scoreboard players operation @s tide.raft.seen_leaves = @s tide.raft.leaves

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

scoreboard players add @a[tag=tide.raft.ocean.settling] tide.raft.travel.age 1
execute as @a[tag=tide.raft.ocean.settling,scores={tide.raft.travel.age=10..}] run function tide:island/raft/ocean/finish_arrival
