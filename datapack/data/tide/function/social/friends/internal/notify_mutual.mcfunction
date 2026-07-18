tag @a remove tide.social.actor
tag @a remove tide.social.target
tag @s add tide.social.actor
execute as @a if score @s tide.identifier.player = #social_target tide.social.tmp run tag @s add tide.social.target

tellraw @s [{"text":"You are now friends with ","color":"gray"},{"selector":"@a[tag=tide.social.target,limit=1]","color":"#09C7E0"},{"text":".","color":"gray"}]
tellraw @a[tag=tide.social.target,limit=1] [{"text":"You are now friends with ","color":"gray"},{"selector":"@a[tag=tide.social.actor,limit=1]","color":"#09C7E0"},{"text":".","color":"gray"}]

tag @s remove tide.social.actor
tag @a[tag=tide.social.target] remove tide.social.target
