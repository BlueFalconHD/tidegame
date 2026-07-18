scoreboard players operation #social_target tide.social.tmp = @s tide.social.remove_confirm
scoreboard players remove #social_target tide.social.tmp 1
scoreboard players reset @s tide.social.remove_confirm
scoreboard players operation #social_source tide.social.tmp = @s tide.identifier.player

execute unless score #social_target tide.social.tmp matches 0.. run return fail
function tide:social/friends/internal/prepare_pair
execute store result score #social_friend_exists tide.social.tmp run function tide:social/friends/internal/friend_exists with storage tide:social scratch.pair
execute unless score #social_friend_exists tide.social.tmp matches 1 run return fail

function tide:social/friends/ui/internal/prepare_viewed
data modify storage tide:social ui.dialog set value {type:"minecraft:confirmation",title:{text:"Remove Friend",color:"#FF8FAF"},body:[],can_close_with_escape:true,pause:false,after_action:"close",yes:{label:{text:"Remove",color:"#FF8FAF"},width:130},no:{label:{text:"Cancel",color:"#F2F2F2"},width:130}}
function tide:social/friends/ui/profile/render_remove_confirm with storage tide:social scratch.viewed
function tide:social/friends/ui/internal/show with storage tide:social ui
data remove storage tide:social scratch.viewed
return 1
