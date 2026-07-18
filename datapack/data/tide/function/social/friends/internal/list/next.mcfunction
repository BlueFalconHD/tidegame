execute unless data storage tide:social scratch.queue[0] run return 0

data modify storage tide:social scratch.current set from storage tide:social scratch.queue[0]
data remove storage tide:social scratch.queue[0]
scoreboard players set #social_list_friend tide.social.tmp -1
function tide:social/friends/internal/list/render with storage tide:social scratch.current
return run function tide:social/friends/internal/list/next
