scoreboard players set #travel_friend tide.identifier.player -1
$execute if score #travel_viewer tide.identifier.player matches $(a) run scoreboard players set #travel_friend tide.identifier.player $(b)
$execute if score #travel_viewer tide.identifier.player matches $(b) run scoreboard players set #travel_friend tide.identifier.player $(a)
execute unless score #travel_friend tide.identifier.player matches 0.. run return 0

data modify storage tide:raft scratch.profile set value {name:"Unknown Player",has_island:0b}
data modify storage tide:raft scratch.lookup set value {}
execute store result storage tide:raft scratch.lookup.id int 1 run scoreboard players get #travel_friend tide.identifier.player
function tide:island/raft/destination/list/load_profile with storage tide:raft scratch.lookup
execute unless data storage tide:raft scratch.profile{has_island:1b} run return 0
execute unless data storage tide:raft scratch.profile.island_id run return 0

scoreboard players set #travel_candidate tide.identifier.island -1
execute store result score #travel_candidate tide.identifier.island run data get storage tide:raft scratch.profile.island_id
execute if score #travel_candidate tide.identifier.island = @s tide.raft.source run return 0

data modify storage tide:raft scratch.candidate set value {}
execute store result storage tide:raft scratch.candidate.island int 1 run scoreboard players get #travel_candidate tide.identifier.island
return run function tide:island/raft/destination/list/consider with storage tide:raft scratch.candidate
