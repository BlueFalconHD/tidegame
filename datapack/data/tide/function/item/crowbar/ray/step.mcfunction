execute if block ~ ~ ~ #tide:pryable run return run function tide:item/crowbar/pry/start
execute unless block ~ ~ ~ minecraft:air unless block ~ ~ ~ minecraft:cave_air unless block ~ ~ ~ minecraft:void_air unless block ~ ~ ~ minecraft:water run return run function tide:item/crowbar/ray/miss

scoreboard players add #ray tide.salvage.tmp 1
execute if score #ray tide.salvage.tmp matches ..17 positioned ^ ^ ^0.25 run return run function tide:item/crowbar/ray/step
return run function tide:item/crowbar/ray/miss
