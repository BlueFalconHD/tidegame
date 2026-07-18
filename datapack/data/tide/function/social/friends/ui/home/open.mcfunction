scoreboard players operation #social_viewer tide.social.tmp = @s tide.identifier.player
scoreboard players set #social_friend_count tide.social.tmp 0
scoreboard players set #social_request_count tide.social.tmp 0

data modify storage tide:social scratch.queue set from storage tide:social friends
function tide:social/friends/ui/home/count_friends_next
data modify storage tide:social scratch.queue set from storage tide:social requests
function tide:social/friends/ui/home/count_requests_next

data modify storage tide:social scratch.home set value {}
execute store result storage tide:social scratch.home.friends int 1 run scoreboard players get #social_friend_count tide.social.tmp
execute store result storage tide:social scratch.home.requests int 1 run scoreboard players get #social_request_count tide.social.tmp

data modify storage tide:social ui.dialog set value {type:"minecraft:multi_action",title:{text:"Friends",color:"#F2F2F2"},body:[{type:"minecraft:plain_message",contents:{text:"Manage friends and friend requests.",color:"#F2F2F2"},width:240}],can_close_with_escape:true,pause:false,after_action:"close",actions:[],columns:1,exit_action:{label:{text:"Close",color:"#F2F2F2"},width:150}}
function tide:social/friends/ui/home/render with storage tide:social scratch.home
execute if entity @s[tag=tide.dev.debug] run function tide:device/radio/debug/render_home
function tide:social/friends/ui/internal/show with storage tide:social ui

data remove storage tide:social scratch.queue
data remove storage tide:social scratch.home
return 1
