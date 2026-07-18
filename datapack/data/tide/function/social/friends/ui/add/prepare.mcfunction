scoreboard players operation #social_source tide.social.tmp = #social_viewer tide.social.tmp
scoreboard players operation #social_target tide.social.tmp = @s tide.identifier.player

function tide:social/friends/internal/prepare_pair
execute store result score #social_friend_exists tide.social.tmp run function tide:social/friends/internal/friend_exists with storage tide:social scratch.pair
execute if score #social_friend_exists tide.social.tmp matches 1 run return 0

function tide:social/friends/internal/prepare_request
execute store result score #social_request_exists tide.social.tmp run function tide:social/friends/internal/request_exists with storage tide:social scratch.request
execute store result score #social_reverse_exists tide.social.tmp run function tide:social/friends/internal/request_exists with storage tide:social scratch.reverse_request

function tide:social/friends/ui/internal/prepare_viewed
execute if score #social_reverse_exists tide.social.tmp matches 1 run function tide:social/friends/ui/add/render_incoming with storage tide:social scratch.viewed
execute unless score #social_reverse_exists tide.social.tmp matches 1 if score #social_request_exists tide.social.tmp matches 1 run function tide:social/friends/ui/add/render_pending with storage tide:social scratch.viewed
execute unless score #social_reverse_exists tide.social.tmp matches 1 unless score #social_request_exists tide.social.tmp matches 1 run function tide:social/friends/ui/add/render_add with storage tide:social scratch.viewed

scoreboard players add #social_ui_entries tide.social.tmp 1
return 1
