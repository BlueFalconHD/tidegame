execute unless data storage tide:raft scratch.render_queue[0] run return 0
data modify storage tide:raft scratch.destination set from storage tide:raft scratch.render_queue[0]
data remove storage tide:raft scratch.render_queue[0]
function tide:island/raft/destination/list/render with storage tide:raft scratch.destination
return run function tide:island/raft/destination/list/render_next
