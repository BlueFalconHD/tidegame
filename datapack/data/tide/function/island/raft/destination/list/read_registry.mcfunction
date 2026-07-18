scoreboard players set #travel_eligible tide.raft.tmp 1
scoreboard players operation #travel_owner tide.identifier.player = @s tide.island.owner
execute store result storage tide:raft scratch.destination.island int 1 run scoreboard players get @s tide.identifier.island
execute store result storage tide:raft scratch.destination.owner int 1 run scoreboard players get @s tide.island.owner
execute if data entity @s data.name run data modify storage tide:raft scratch.destination.name set from entity @s data.name
return 1
