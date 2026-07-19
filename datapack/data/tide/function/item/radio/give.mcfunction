execute unless entity @s[type=minecraft:player] run return fail

scoreboard players set #radio_given tide.device.tmp 0
execute store success score #radio_given tide.device.tmp run loot give @s loot tide:item/radio
execute unless score #radio_given tide.device.tmp matches 1 run title @s actionbar {"text":"The radio could not be given.","color":"#D94286"}
return run scoreboard players get #radio_given tide.device.tmp
