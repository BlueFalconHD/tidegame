scoreboard players operation #radio_id tide.device.id = @s tide.device.id
scoreboard players set #radio_interaction_found tide.device.tmp 0
execute as @e[type=minecraft:interaction,tag=tide.device.radio.interaction,distance=..2] if score @s tide.device.id = #radio_id tide.device.id run scoreboard players set #radio_interaction_found tide.device.tmp 1
execute if score #radio_interaction_found tide.device.tmp matches 1 run return 1

scoreboard players operation #radio_owner tide.identifier.player = @s tide.device.owner
return run execute positioned ~ ~-0.5 ~ run function tide:device/radio/placed/create_interaction
