scoreboard players operation #social_viewer tide.social.tmp = @s tide.identifier.player
scoreboard players set #social_ui_entries tide.social.tmp 0

data modify storage tide:social ui.dialog set value {type:"minecraft:multi_action",title:{text:"Friend Requests",color:"#F2F2F2"},body:[{type:"minecraft:plain_message",contents:{text:"Incoming and sent friend requests.",color:"#F2F2F2"},width:260}],can_close_with_escape:true,pause:false,after_action:"close",actions:[],columns:1,exit_action:{label:{text:"Back",color:"#F2F2F2"},width:150,action:{type:"run_command",command:"trigger tide.social.menu set 4"}}}
data modify storage tide:social scratch.queue set from storage tide:social requests
function tide:social/friends/ui/requests/next
execute unless score #social_ui_entries tide.social.tmp matches 1.. run function tide:social/friends/ui/requests/empty

function tide:social/friends/ui/internal/show with storage tide:social ui
data remove storage tide:social scratch.queue
data remove storage tide:social scratch.viewed
return 1
