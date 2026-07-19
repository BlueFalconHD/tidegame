scoreboard players remove @a[scores={tide.device.cooldown=1..}] tide.device.cooldown 1

execute in minecraft:overworld run function tide:item/radio/tick_dimension
execute in tide:ocean run function tide:item/radio/tick_dimension
execute in minecraft:the_nether run function tide:item/radio/tick_dimension
execute in minecraft:the_end run function tide:item/radio/tick_dimension
