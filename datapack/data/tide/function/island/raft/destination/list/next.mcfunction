execute unless data storage tide:raft scratch.queue[0] run return 0
data modify storage tide:raft scratch.current set from storage tide:raft scratch.queue[0]
data remove storage tide:raft scratch.queue[0]
function tide:island/raft/destination/list/render_pair with storage tide:raft scratch.current
return run function tide:island/raft/destination/list/next
