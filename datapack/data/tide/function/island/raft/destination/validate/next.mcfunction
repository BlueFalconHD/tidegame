execute unless data storage tide:raft scratch.validation_queue[0] run return 0
data modify storage tide:raft scratch.validation_pair set from storage tide:raft scratch.validation_queue[0]
data remove storage tide:raft scratch.validation_queue[0]
function tide:island/raft/destination/validate/pair with storage tide:raft scratch.validation_pair
execute if score #travel_friend_valid tide.raft.tmp matches 1 run return 1
return run function tide:island/raft/destination/validate/next
