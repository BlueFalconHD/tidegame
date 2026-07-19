scoreboard players operation #social_menu tide.social.tmp = @s tide.social.menu
scoreboard players reset @s tide.social.menu

execute if score #social_menu tide.social.tmp matches 1 run return run function tide:social/friends/ui/list/open
execute if score #social_menu tide.social.tmp matches 2 run return run function tide:social/friends/ui/requests/open
execute if score #social_menu tide.social.tmp matches 3 run return run function tide:social/friends/ui/add/open
execute if score #social_menu tide.social.tmp matches 4 run return run function tide:social/friends/ui/home/open
execute if score #social_menu tide.social.tmp matches 5 if entity @s[tag=tide.dev.debug] run return run function tide:social/friends/ui/debug/open
return fail
