data modify storage tide:social scratch.lookup set value {}
execute store result storage tide:social scratch.lookup.target int 1 run scoreboard players get #social_target tide.social.tmp

data modify storage tide:social scratch.viewed set value {name:"Unknown Player",has_island:0b}
function tide:social/friends/ui/internal/load_profile with storage tide:social scratch.lookup

scoreboard players operation #social_action_target tide.social.tmp = #social_target tide.social.tmp
scoreboard players add #social_action_target tide.social.tmp 1
execute store result storage tide:social scratch.viewed.action_target int 1 run scoreboard players get #social_action_target tide.social.tmp
execute store result storage tide:social scratch.viewed.id int 1 run scoreboard players get #social_target tide.social.tmp

scoreboard players set #social_target_online tide.social.tmp 0
execute as @a if score @s tide.identifier.player = #social_target tide.social.tmp run scoreboard players set #social_target_online tide.social.tmp 1
execute store result storage tide:social scratch.viewed.online byte 1 run scoreboard players get #social_target_online tide.social.tmp
execute as @a if score @s tide.identifier.player = #social_target tide.social.tmp at @s run function tide:social/friends/ui/internal/load_location
execute if data storage tide:social scratch.viewed{has_island:1b} run function tide:social/friends/ui/internal/load_island_name
