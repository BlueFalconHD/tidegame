advancement revoke @s only tide:item/radio/use

execute if score @s tide.device.cooldown matches 1.. run return 0
scoreboard players set @s tide.device.cooldown 10

execute if predicate tide:item/radio/sneaking run return run function tide:item/radio/place/start

playsound minecraft:block.note_block.bit master @s ~ ~ ~ 0.45 1.65
return run function tide:social/friends/open
