execute if entity @s[tag=tide.raft.travel.departing] if score @s tide.loading.state matches 1..2 run function tide:runtime/loading/stop
execute if entity @s[tag=tide.raft.travel.pending] if score @s tide.loading.state matches 1..2 run function tide:runtime/loading/stop
return run function tide:island/raft/destination/internal/cleanup
