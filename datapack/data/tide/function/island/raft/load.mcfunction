scoreboard objectives add tide.raft.x dummy
scoreboard objectives add tide.raft.y dummy
scoreboard objectives add tide.raft.z dummy
scoreboard objectives add tide.raft.state dummy
scoreboard objectives add tide.raft.age dummy
scoreboard objectives add tide.raft.tmp dummy
scoreboard objectives add tide.raft.placed minecraft.used:minecraft.bamboo_raft
scoreboard objectives add tide.raft.source dummy
scoreboard objectives add tide.raft.destination dummy
scoreboard objectives add tide.raft.travel trigger
scoreboard objectives add tide.raft.travel.age dummy
scoreboard objectives add tide.raft.leaves minecraft.custom:minecraft.leave_game
scoreboard objectives add tide.raft.seen_leaves dummy

execute as @a[tag=tide.raft.travel.departing,scores={tide.loading.state=1..}] run function tide:runtime/loading/clear
execute as @a[tag=tide.raft.travel.pending,scores={tide.loading.state=1..}] run function tide:runtime/loading/clear
tag @a remove tide.raft.travel.session
tag @a remove tide.raft.travel.departing
tag @a remove tide.raft.travel.pending
tag @a remove tide.raft.traveler
scoreboard players reset @a tide.raft.travel
scoreboard players reset @a tide.raft.travel.age
scoreboard players reset @a tide.raft.source
scoreboard players reset @a tide.raft.destination
