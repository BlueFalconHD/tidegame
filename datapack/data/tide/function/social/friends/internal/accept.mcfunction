execute unless entity @s[type=minecraft:player] run return fail
execute unless score @s tide.identifier.player matches 0.. run function tide:runtime/identifier/assign/player

# The action target is the player who originally sent the request.
scoreboard players operation #social_source tide.social.tmp = @s tide.social.accept
scoreboard players remove #social_source tide.social.tmp 1
scoreboard players operation #social_target tide.social.tmp = @s tide.identifier.player
scoreboard players reset @s tide.social.accept

execute unless score #social_source tide.social.tmp matches 0.. run tellraw @s {"text":"Invalid friend request.","color":"#D94286"}
execute unless score #social_source tide.social.tmp matches 0.. run return fail

function tide:social/friends/internal/prepare_request
execute store result score #social_request_exists tide.social.tmp run function tide:social/friends/internal/request_exists with storage tide:social scratch.request
execute unless score #social_request_exists tide.social.tmp matches 1 run tellraw @s {"text":"That friend request no longer exists.","color":"#D94286"}
execute unless score #social_request_exists tide.social.tmp matches 1 run return fail

function tide:social/friends/internal/prepare_pair
execute store result score #social_friend_exists tide.social.tmp run function tide:social/friends/internal/friend_exists with storage tide:social scratch.pair
execute unless score #social_friend_exists tide.social.tmp matches 1 run function tide:social/friends/internal/create_friendship
execute if score #social_friend_exists tide.social.tmp matches 1 run function tide:social/friends/internal/remove_pair_requests with storage tide:social scratch.pair

tag @a remove tide.social.actor
tag @s add tide.social.actor
execute as @a if score @s tide.identifier.player = #social_source tide.social.tmp run tellraw @s [{"selector":"@a[tag=tide.social.actor,limit=1]","color":"#09C7E0"},{"text":" accepted your friend request.","color":"gray"}]
tag @s remove tide.social.actor
tellraw @s {"text":"Friend request accepted.","color":"#E0CA8E"}
return 1
