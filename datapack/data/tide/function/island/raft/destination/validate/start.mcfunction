scoreboard players operation #travel_viewer tide.identifier.player = @s tide.identifier.player
scoreboard players set #travel_friend_valid tide.raft.tmp 0
execute if entity @s[tag=tide.island.has_island] if score @s tide.identifier.island = #travel_destination tide.identifier.island run scoreboard players set #travel_friend_valid tide.raft.tmp 1
execute if score #travel_friend_valid tide.raft.tmp matches 1 run return 1
data modify storage tide:raft scratch.validation_queue set from storage tide:social friends
function tide:island/raft/destination/validate/next
data remove storage tide:raft scratch.validation_queue
return run scoreboard players get #travel_friend_valid tide.raft.tmp
