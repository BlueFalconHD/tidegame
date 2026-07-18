execute as @e[type=minecraft:interaction,tag=tide.device.radio.interaction] if data entity @s interaction run function tide:device/radio/placed/interact
execute as @e[type=minecraft:interaction,tag=tide.device.radio.interaction] if data entity @s attack run function tide:device/radio/placed/attack

execute as @e[type=minecraft:item_display,tag=tide.device.radio.display] at @s if block ~ ~-1 ~ #minecraft:replaceable run function tide:device/radio/placed/drop
execute as @e[type=minecraft:item_display,tag=tide.device.radio.display] at @s run function tide:device/radio/placed/ensure_interaction
execute as @e[type=minecraft:interaction,tag=tide.device.radio.interaction] at @s run function tide:device/radio/placed/validate_interaction
