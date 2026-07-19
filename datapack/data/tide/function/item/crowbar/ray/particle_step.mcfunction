execute if block ~ ~ ~ #tide:pryable run return run particle minecraft:crit ~ ~ ~ 0.08 0.08 0.08 0.02 2 force @s
execute unless block ~ ~ ~ minecraft:air unless block ~ ~ ~ minecraft:cave_air unless block ~ ~ ~ minecraft:void_air unless block ~ ~ ~ minecraft:water run return 0

scoreboard players add #ray tide.salvage.tmp 1
execute if score #ray tide.salvage.tmp matches ..17 positioned ^ ^ ^0.25 run return run function tide:item/crowbar/ray/particle_step
