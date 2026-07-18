scoreboard players operation #social_target tide.social.tmp = @s tide.social.profile
scoreboard players remove #social_target tide.social.tmp 1
scoreboard players reset @s tide.social.profile
scoreboard players operation #social_source tide.social.tmp = @s tide.identifier.player

execute unless score #social_target tide.social.tmp matches 0.. run return fail
function tide:social/friends/internal/prepare_pair
execute store result score #social_friend_exists tide.social.tmp run function tide:social/friends/internal/friend_exists with storage tide:social scratch.pair
execute unless score #social_friend_exists tide.social.tmp matches 1 run tellraw @s {"text":"You are no longer friends with that player.","color":"#D94286"}
execute unless score #social_friend_exists tide.social.tmp matches 1 run return fail

function tide:social/friends/ui/internal/prepare_viewed
data modify storage tide:social ui.dialog set value {type:"minecraft:multi_action",title:{text:"Friend",color:"#F2F2F2"},body:[],can_close_with_escape:true,pause:false,after_action:"close",actions:[],columns:1,exit_action:{label:{text:"Back",color:"#F2F2F2"},width:150,action:{type:"run_command",command:"trigger tide.social.menu set 1"}}}
function tide:social/friends/ui/profile/render_title with storage tide:social scratch.viewed
execute if data storage tide:social scratch.viewed{online:1b} run data modify storage tide:social ui.dialog.body append value {type:"minecraft:plain_message",contents:[{text:"●",color:"#E0CA8E"},{text:" Online",color:"#F2F2F2"}],width:260}
execute unless data storage tide:social scratch.viewed{online:1b} run data modify storage tide:social ui.dialog.body append value {type:"minecraft:plain_message",contents:[{text:"○",color:"gray"},{text:" Offline",color:"#F2F2F2"}],width:260}
execute if data storage tide:social scratch.viewed{has_island:1b} run function tide:social/friends/ui/profile/render_membership with storage tide:social scratch.viewed
execute unless data storage tide:social scratch.viewed{has_island:1b} run data modify storage tide:social ui.dialog.body append value {type:"minecraft:plain_message",contents:{text:"Member of: No island",color:"#F2F2F2"},width:260}
execute if data storage tide:social scratch.viewed{online:1b} run data modify storage tide:social ui.dialog.body append value {type:"minecraft:plain_message",contents:{text:"Current location: Open Ocean",color:"#F2F2F2"},width:260}
function tide:social/friends/ui/profile/render_remove with storage tide:social scratch.viewed

function tide:social/friends/ui/internal/show with storage tide:social ui
data remove storage tide:social scratch.viewed
return 1
