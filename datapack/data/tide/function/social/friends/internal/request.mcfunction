execute unless entity @s[type=minecraft:player] run return fail
execute unless score @s tide.identifier.player matches 0.. run function tide:runtime/identifier/assign/player

scoreboard players operation #social_source tide.social.tmp = @s tide.identifier.player
scoreboard players operation #social_target tide.social.tmp = @s tide.social.request
scoreboard players remove #social_target tide.social.tmp 1
scoreboard players reset @s tide.social.request

execute unless score #social_target tide.social.tmp matches 0.. run tellraw @s {"text":"Invalid friend target.","color":"red"}
execute unless score #social_target tide.social.tmp matches 0.. run return fail
execute if score #social_source tide.social.tmp = #social_target tide.social.tmp run tellraw @s {"text":"You cannot add yourself as a friend.","color":"red"}
execute if score #social_source tide.social.tmp = #social_target tide.social.tmp run return fail

scoreboard players set #social_target_online tide.social.tmp 0
execute as @a if score @s tide.identifier.player = #social_target tide.social.tmp run scoreboard players set #social_target_online tide.social.tmp 1
execute unless score #social_target_online tide.social.tmp matches 1 run tellraw @s {"text":"That player is not online.","color":"red"}
execute unless score #social_target_online tide.social.tmp matches 1 run return fail

function tide:social/friends/internal/prepare_pair
execute store result score #social_friend_exists tide.social.tmp run function tide:social/friends/internal/friend_exists with storage tide:social scratch.pair
execute if score #social_friend_exists tide.social.tmp matches 1 run tellraw @s {"text":"You are already friends.","color":"red"}
execute if score #social_friend_exists tide.social.tmp matches 1 run return fail

function tide:social/friends/internal/prepare_request
execute store result score #social_request_exists tide.social.tmp run function tide:social/friends/internal/request_exists with storage tide:social scratch.request
execute if score #social_request_exists tide.social.tmp matches 1 run tellraw @s {"text":"You already sent that player a friend request.","color":"red"}
execute if score #social_request_exists tide.social.tmp matches 1 run return fail

execute store result score #social_reverse_exists tide.social.tmp run function tide:social/friends/internal/request_exists with storage tide:social scratch.reverse_request
execute if score #social_reverse_exists tide.social.tmp matches 1 run function tide:social/friends/internal/create_friendship
execute if score #social_reverse_exists tide.social.tmp matches 1 run function tide:social/friends/internal/notify_mutual
execute if score #social_reverse_exists tide.social.tmp matches 1 run return 1

data modify storage tide:social requests append from storage tide:social scratch.request
tag @a remove tide.social.actor
tag @s add tide.social.actor
scoreboard players operation #social_action_target tide.social.tmp = #social_source tide.social.tmp
scoreboard players add #social_action_target tide.social.tmp 1
data modify storage tide:social scratch.action set value {}
execute store result storage tide:social scratch.action.target int 1 run scoreboard players get #social_action_target tide.social.tmp
execute as @a if score @s tide.identifier.player = #social_target tide.social.tmp run function tide:social/friends/internal/notify_request with storage tide:social scratch.action
tag @s remove tide.social.actor
data remove storage tide:social scratch.action
tellraw @s {"text":"Friend request sent.","color":"aqua"}
return 1
