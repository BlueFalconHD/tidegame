scoreboard players operation #radio_id tide.device.id = @s tide.device.id
execute as @e[type=minecraft:interaction,tag=tide.device.radio.interaction,distance=..2] if score @s tide.device.id = #radio_id tide.device.id run kill @s

loot spawn ~ ~-0.5 ~ loot tide:device/radio
playsound minecraft:entity.item.pickup player @a[tag=tide.device.radio.picker,limit=1] ~ ~ ~ 0.8 1.0
scoreboard players set #radio_picked_up tide.device.tmp 1
kill @s
return 1
