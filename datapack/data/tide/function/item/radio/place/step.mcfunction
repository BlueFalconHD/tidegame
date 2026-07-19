scoreboard players add #radio_raycast tide.device.tmp 1

execute unless block ~ ~ ~ #minecraft:replaceable run return run function tide:item/radio/place/hit
execute if score #radio_raycast tide.device.tmp matches ..20 positioned ^ ^ ^0.25 run return run function tide:item/radio/place/step

title @s actionbar {"text":"Aim at the top of a nearby block to place the radio.","color":"#F79317"}
return 0
