execute unless score @s tide.identifier.player matches 0.. run function tide:runtime/identifier/assign/player

scoreboard players operation #radio_id tide.device.id = .next tide.device.id
scoreboard players add .next tide.device.id 1
scoreboard players operation #radio_owner tide.identifier.player = @s tide.identifier.player

tag @e[tag=tide.device.radio.display.new] remove tide.device.radio.display.new
scoreboard players set #radio_display_summoned tide.device.tmp 0
execute store success score #radio_display_summoned tide.device.tmp run summon minecraft:item_display ~ ~0.5 ~ {Tags:["tide.device.radio","tide.device.radio.display","tide.device.radio.display.new"],item_display:"fixed",view_range:32f}
execute unless score #radio_display_summoned tide.device.tmp matches 1 run title @s actionbar {"text":"The radio could not be placed.","color":"#D94286"}
execute unless score #radio_display_summoned tide.device.tmp matches 1 run return fail

scoreboard players operation @e[type=minecraft:item_display,tag=tide.device.radio.display.new,sort=nearest,limit=1] tide.device.id = #radio_id tide.device.id
scoreboard players operation @e[type=minecraft:item_display,tag=tide.device.radio.display.new,sort=nearest,limit=1] tide.device.owner = #radio_owner tide.identifier.player
item replace entity @e[type=minecraft:item_display,tag=tide.device.radio.display.new,sort=nearest,limit=1] contents with minecraft:paper[minecraft:item_model="tide:radio"]
tp @e[type=minecraft:item_display,tag=tide.device.radio.display.new,sort=nearest,limit=1] ~ ~0.5 ~ ~ 0

scoreboard players set #radio_interaction_summoned tide.device.tmp 0
execute store result score #radio_interaction_summoned tide.device.tmp run function tide:device/radio/placed/create_interaction
execute unless score #radio_interaction_summoned tide.device.tmp matches 1 run kill @e[type=minecraft:item_display,tag=tide.device.radio.display.new,sort=nearest,limit=1]
execute unless score #radio_interaction_summoned tide.device.tmp matches 1 run title @s actionbar {"text":"The radio interaction could not be created.","color":"#D94286"}
execute unless score #radio_interaction_summoned tide.device.tmp matches 1 run return fail

tag @e[type=minecraft:item_display,tag=tide.device.radio.display.new,sort=nearest,limit=1] remove tide.device.radio.display.new
clear @s minecraft:paper[minecraft:custom_data~{tide:{radio:true}}] 1

playsound minecraft:block.wood.place block @a[distance=..12] ~ ~ ~ 0.7 1.2
title @s actionbar {"text":"Radio placed. Punch to pick up.","color":"#F2F2F2"}
return 1
