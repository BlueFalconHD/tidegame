scoreboard players operation #social_source tide.social.tmp = @s tide.social.respond
scoreboard players remove #social_source tide.social.tmp 1
scoreboard players reset @s tide.social.respond
scoreboard players operation #social_target tide.social.tmp = @s tide.identifier.player

execute unless score #social_source tide.social.tmp matches 0.. run return fail
function tide:social/friends/internal/prepare_request
execute store result score #social_request_exists tide.social.tmp run function tide:social/friends/internal/request_exists with storage tide:social scratch.request
execute unless score #social_request_exists tide.social.tmp matches 1 run tellraw @s {"text":"That friend request no longer exists.","color":"#D94286"}
execute unless score #social_request_exists tide.social.tmp matches 1 run return fail

scoreboard players operation #social_target tide.social.tmp = #social_source tide.social.tmp
function tide:social/friends/ui/internal/prepare_viewed
data modify storage tide:social ui.dialog set value {type:"minecraft:multi_action",title:{text:"Friend Request",color:"#F79317"},body:[],can_close_with_escape:true,pause:false,after_action:"close",actions:[],columns:2,exit_action:{label:{text:"Back",color:"gray"},width:150,action:{type:"run_command",command:"trigger tide.social.menu set 2"}}}
function tide:social/friends/ui/requests/render_response with storage tide:social scratch.viewed
function tide:social/friends/ui/internal/show with storage tide:social ui
data remove storage tide:social scratch.viewed
return 1
