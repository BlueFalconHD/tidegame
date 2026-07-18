execute unless data storage tide:social scratch.queue[0] run return 0
data modify storage tide:social scratch.current set from storage tide:social scratch.queue[0]
data remove storage tide:social scratch.queue[0]
function tide:social/friends/ui/home/count_request with storage tide:social scratch.current
return run function tide:social/friends/ui/home/count_requests_next
