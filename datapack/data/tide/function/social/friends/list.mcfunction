execute unless entity @s[type=minecraft:player] run return fail
execute unless score @s tide.identifier.player matches 0.. run function tide:runtime/identifier/assign/player

scoreboard players operation #social_viewer tide.social.tmp = @s tide.identifier.player
scoreboard players set #social_listed tide.social.tmp 0
data modify storage tide:social scratch.queue set from storage tide:social friends

tellraw @s {"text":"Friends","color":"#09C7E0","bold":true}
function tide:social/friends/internal/list/next
execute unless score #social_listed tide.social.tmp matches 1.. run tellraw @s {"text":"  No friends yet.","color":"gray"}

tag @a remove tide.social.list_target
data remove storage tide:social scratch.queue
data remove storage tide:social scratch.current
data remove storage tide:social scratch.list
return 1
