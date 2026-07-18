scoreboard players operation #radio_id tide.device.id = @s tide.device.id
execute as @e[type=minecraft:interaction,tag=tide.device.radio.interaction,distance=..2] if score @s tide.device.id = #radio_id tide.device.id run kill @s

loot spawn ~ ~-0.5 ~ loot tide:device/radio
playsound minecraft:block.wood.break block @a[distance=..12] ~ ~ ~ 0.7 1.2
kill @s
return 1
