execute unless entity @s[type=minecraft:player] run return fail
execute unless score @s tide.identifier.player matches 0.. run function tide:runtime/identifier/assign/player

scoreboard players operation #social_source tide.social.tmp = @s tide.identifier.player
scoreboard players operation #social_target tide.social.tmp = @s tide.social.cancel
scoreboard players remove #social_target tide.social.tmp 1
scoreboard players reset @s tide.social.cancel

execute unless score #social_target tide.social.tmp matches 0.. run return fail
function tide:social/friends/internal/prepare_request
execute store result score #social_request_exists tide.social.tmp run function tide:social/friends/internal/request_exists with storage tide:social scratch.request
execute unless score #social_request_exists tide.social.tmp matches 1 run tellraw @s {"text":"That friend request no longer exists.","color":"red"}
execute unless score #social_request_exists tide.social.tmp matches 1 run return fail

function tide:social/friends/internal/remove_request with storage tide:social scratch.request
tellraw @s {"text":"Friend request canceled.","color":"gray"}
return 1
