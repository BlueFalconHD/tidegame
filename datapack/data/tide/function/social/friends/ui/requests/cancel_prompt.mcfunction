scoreboard players operation #social_target tide.social.tmp = @s tide.social.cancel_prompt
scoreboard players remove #social_target tide.social.tmp 1
scoreboard players reset @s tide.social.cancel_prompt
scoreboard players operation #social_source tide.social.tmp = @s tide.identifier.player

execute unless score #social_target tide.social.tmp matches 0.. run return fail
function tide:social/friends/internal/prepare_request
execute store result score #social_request_exists tide.social.tmp run function tide:social/friends/internal/request_exists with storage tide:social scratch.request
execute unless score #social_request_exists tide.social.tmp matches 1 run tellraw @s {"text":"That friend request no longer exists.","color":"red"}
execute unless score #social_request_exists tide.social.tmp matches 1 run return fail

function tide:social/friends/ui/internal/prepare_viewed
data modify storage tide:social ui.dialog set value {type:"minecraft:confirmation",title:{text:"Cancel Request",color:"#F2F2F2"},body:[],can_close_with_escape:true,pause:false,after_action:"close",yes:{label:{text:"Cancel Request",color:"#F2F2F2"},width:140},no:{label:{text:"Keep Waiting",color:"#F2F2F2"},width:140}}
function tide:social/friends/ui/requests/render_cancel_prompt with storage tide:social scratch.viewed
function tide:social/friends/ui/internal/show with storage tide:social ui
data remove storage tide:social scratch.viewed
return 1
