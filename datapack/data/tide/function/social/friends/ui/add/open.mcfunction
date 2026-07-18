scoreboard players operation #social_viewer tide.social.tmp = @s tide.identifier.player
scoreboard players set #social_ui_entries tide.social.tmp 0
tag @a remove tide.social.viewer
tag @s add tide.social.viewer

data modify storage tide:social ui.dialog set value {type:"minecraft:multi_action",title:{text:"Add Friend",color:"#E0CA8E"},body:[{type:"minecraft:plain_message",contents:{text:"Choose an online player.",color:"gray"},width:260}],can_close_with_escape:true,pause:false,after_action:"close",actions:[],columns:1,exit_action:{label:{text:"Back",color:"gray"},width:150,action:{type:"run_command",command:"trigger tide.social.menu set 4"}}}
execute as @a[tag=!tide.social.viewer] run function tide:social/friends/ui/add/prepare
execute unless score #social_ui_entries tide.social.tmp matches 1.. run data modify storage tide:social ui.dialog.body append value {type:"minecraft:plain_message",contents:{text:"No available online players.",color:"gray"},width:260}

function tide:social/friends/ui/internal/show with storage tide:social ui
tag @s remove tide.social.viewer
data remove storage tide:social scratch.viewed
return 1
