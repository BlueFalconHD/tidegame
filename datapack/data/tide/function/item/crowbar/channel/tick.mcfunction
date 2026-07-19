advancement revoke @s only tide:item/crowbar/use

execute unless predicate tide:item/crowbar/in_ocean run return run scoreboard players reset @s tide.salvage.channel
execute unless items entity @s weapon.mainhand minecraft:breeze_rod[minecraft:custom_data~{tide:{salvage_crowbar:1}}] run return run scoreboard players reset @s tide.salvage.channel

scoreboard players set @s tide.salvage.active 2
scoreboard players add @s tide.salvage.channel 1

execute if score @s tide.salvage.channel matches 1 run playsound minecraft:block.iron_door.open block @s ~ ~ ~ 0.35 0.5
execute if score @s tide.salvage.channel matches 20 run playsound minecraft:block.iron_door.open block @s ~ ~ ~ 0.35 0.5
execute if score @s tide.salvage.channel matches 5 run function tide:item/crowbar/ray/particle_start
execute if score @s tide.salvage.channel matches 15 run function tide:item/crowbar/ray/particle_start
execute if score @s tide.salvage.channel matches 25 run function tide:item/crowbar/ray/particle_start
execute if score @s tide.salvage.channel matches 35 run function tide:item/crowbar/ray/particle_start

execute if score @s tide.salvage.channel matches 40.. run function tide:item/crowbar/channel/complete
