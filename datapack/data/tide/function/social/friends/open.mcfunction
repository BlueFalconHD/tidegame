execute unless entity @s[type=minecraft:player] run return fail
execute unless score @s tide.identifier.player matches 0.. run function tide:runtime/identifier/assign/player
scoreboard players reset @s tide.social.open

tag @a remove tide.social.viewer
tag @s add tide.social.viewer

function tide:social/friends/list

tellraw @s {"text":"Online players","color":"aqua","bold":true}
#why it red
scoreboard players operation #social_viewer tide.social.tmp = @s tide.identifier.player
scoreboard players set #social_candidates tide.social.tmp 0
execute as @a[tag=!tide.social.viewer] run function tide:social/friends/internal/online/prepare
execute unless score #social_candidates tide.social.tmp matches 1.. run tellraw @s {"text":"  No available players.","color":"gray"}

tag @s remove tide.social.viewer
data remove storage tide:social scratch.online
return 1
