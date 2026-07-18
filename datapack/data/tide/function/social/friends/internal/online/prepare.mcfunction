scoreboard players operation #social_source tide.social.tmp = #social_viewer tide.social.tmp
scoreboard players operation #social_target tide.social.tmp = @s tide.identifier.player

function tide:social/friends/internal/prepare_pair
execute store result score #social_friend_exists tide.social.tmp run function tide:social/friends/internal/friend_exists with storage tide:social scratch.pair
execute if score #social_friend_exists tide.social.tmp matches 1 run return 0

function tide:social/friends/internal/prepare_request
execute store result score #social_request_exists tide.social.tmp run function tide:social/friends/internal/request_exists with storage tide:social scratch.request
execute store result score #social_reverse_exists tide.social.tmp run function tide:social/friends/internal/request_exists with storage tide:social scratch.reverse_request

data modify storage tide:social scratch.online set value {}
scoreboard players operation #social_action_target tide.social.tmp = #social_target tide.social.tmp
scoreboard players add #social_action_target tide.social.tmp 1
execute store result storage tide:social scratch.online.target int 1 run scoreboard players get #social_action_target tide.social.tmp

execute if score #social_reverse_exists tide.social.tmp matches 1 run function tide:social/friends/internal/online/render_incoming with storage tide:social scratch.online
execute unless score #social_reverse_exists tide.social.tmp matches 1 if score #social_request_exists tide.social.tmp matches 1 run function tide:social/friends/internal/online/render_pending
execute unless score #social_reverse_exists tide.social.tmp matches 1 unless score #social_request_exists tide.social.tmp matches 1 run function tide:social/friends/internal/online/render_add with storage tide:social scratch.online

scoreboard players add #social_candidates tide.social.tmp 1
return 1
