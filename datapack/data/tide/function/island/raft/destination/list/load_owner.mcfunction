$execute unless data storage tide:social profiles[{id:$(id)}].name run return 0
$data modify storage tide:raft scratch.owner set from storage tide:social profiles[{id:$(id)}]
scoreboard players set #travel_owner_found tide.raft.tmp 1
return 1
