execute unless entity @s[type=minecraft:player] run return fail
execute unless score @s tide.identifier.player matches 0.. run function tide:runtime/identifier/assign/player
scoreboard players reset @s tide.social.open
execute as @a run function tide:social/profile/sync
return run function tide:social/friends/ui/home/open
