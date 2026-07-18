execute unless entity @s[tag=tide.island.has_island] run return 1

scoreboard players operation #membership_island tide.identifier.island = @s tide.identifier.island
scoreboard players set #membership_valid tide.island.tmp 0
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry,tag=!tide.island.destroying] if score @s tide.identifier.island = #membership_island tide.identifier.island run scoreboard players set #membership_valid tide.island.tmp 1
execute if score #membership_valid tide.island.tmp matches 1 run return 1

execute if score @s tide.player.island.state matches 1 if score @s tide.loading.state matches 1.. run function tide:runtime/loading/clear
tag @s remove tide.island.has_island
tag @s remove tide.island.name.ready
tag @s remove tide.island.renaming
scoreboard players reset @s tide.identifier.island
scoreboard players set @s tide.player.island.state 0
scoreboard players reset @s tide.player.island.fade
scoreboard players reset @s tide.island.rename
title @s actionbar {"text":"The island you belonged to no longer exists.","color":"#D94286"}
return 1
