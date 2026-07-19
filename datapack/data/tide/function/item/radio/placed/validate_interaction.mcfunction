scoreboard players operation #radio_id tide.device.id = @s tide.device.id
scoreboard players set #radio_display_found tide.device.tmp 0
execute as @e[type=minecraft:item_display,tag=tide.device.radio.display,distance=..2] if score @s tide.device.id = #radio_id tide.device.id run scoreboard players set #radio_display_found tide.device.tmp 1
execute unless score #radio_display_found tide.device.tmp matches 1 run kill @s
return run scoreboard players get #radio_display_found tide.device.tmp
