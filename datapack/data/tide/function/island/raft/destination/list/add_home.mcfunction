execute unless entity @s[tag=tide.island.has_island] run return 0

scoreboard players operation #travel_candidate tide.identifier.island = @s tide.identifier.island
execute if score #travel_candidate tide.identifier.island = @s tide.raft.source run return 0

data modify storage tide:raft scratch.candidate set value {}
execute store result storage tide:raft scratch.candidate.island int 1 run scoreboard players get #travel_candidate tide.identifier.island
return run function tide:island/raft/destination/list/consider with storage tide:raft scratch.candidate
