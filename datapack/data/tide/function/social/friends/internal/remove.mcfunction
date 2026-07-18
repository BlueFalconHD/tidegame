execute unless entity @s[type=minecraft:player] run return fail
execute unless score @s tide.identifier.player matches 0.. run function tide:runtime/identifier/assign/player

scoreboard players operation #social_source tide.social.tmp = @s tide.identifier.player
scoreboard players operation #social_target tide.social.tmp = @s tide.social.remove
scoreboard players remove #social_target tide.social.tmp 1
scoreboard players reset @s tide.social.remove

execute unless score #social_target tide.social.tmp matches 0.. run tellraw @s {"text":"Invalid friend target.","color":"#D94286"}
execute unless score #social_target tide.social.tmp matches 0.. run return fail

function tide:social/friends/internal/prepare_pair
execute store result score #social_friend_exists tide.social.tmp run function tide:social/friends/internal/friend_exists with storage tide:social scratch.pair
execute unless score #social_friend_exists tide.social.tmp matches 1 run tellraw @s {"text":"You are not friends with that player.","color":"#D94286"}
execute unless score #social_friend_exists tide.social.tmp matches 1 run return fail

function tide:social/friends/internal/remove_friendship with storage tide:social scratch.pair
tag @a remove tide.social.actor
tag @s add tide.social.actor
execute as @a if score @s tide.identifier.player = #social_target tide.social.tmp run tellraw @s [{"selector":"@a[tag=tide.social.actor,limit=1]","color":"#09C7E0"},{"text":" removed you as a friend.","color":"gray"}]
tag @s remove tide.social.actor
tellraw @s {"text":"Friend removed.","color":"gray"}
return 1
