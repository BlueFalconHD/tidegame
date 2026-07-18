$execute if score #social_viewer tide.social.tmp matches $(a) run scoreboard players set #social_list_friend tide.social.tmp $(b)
$execute if score #social_viewer tide.social.tmp matches $(b) run scoreboard players set #social_list_friend tide.social.tmp $(a)
execute unless score #social_list_friend tide.social.tmp matches 0.. run return 0

tag @a remove tide.social.list_target
execute as @a if score @s tide.identifier.player = #social_list_friend tide.social.tmp run tag @s add tide.social.list_target
data modify storage tide:social scratch.list set value {}
scoreboard players operation #social_action_target tide.social.tmp = #social_list_friend tide.social.tmp
scoreboard players add #social_action_target tide.social.tmp 1
execute store result storage tide:social scratch.list.target int 1 run scoreboard players get #social_action_target tide.social.tmp
execute if entity @a[tag=tide.social.list_target,limit=1] run function tide:social/friends/internal/list/render_online with storage tide:social scratch.list
execute unless entity @a[tag=tide.social.list_target,limit=1] run function tide:social/friends/internal/list/render_offline with storage tide:social scratch.list
scoreboard players add #social_listed tide.social.tmp 1
tag @a[tag=tide.social.list_target] remove tide.social.list_target
return 1
