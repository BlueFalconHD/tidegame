scoreboard players set #travel_available tide.raft.tmp 1
execute if data entity @s data.name run data modify storage tide:raft scratch.arrival_name set from entity @s data.name
return 1
