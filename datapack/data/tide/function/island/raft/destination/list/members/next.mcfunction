execute unless data storage tide:raft scratch.member_queue[0] run return 0
data modify storage tide:raft scratch.member set from storage tide:raft scratch.member_queue[0]
data remove storage tide:raft scratch.member_queue[0]
function tide:island/raft/destination/list/members/consider
return run function tide:island/raft/destination/list/members/next
