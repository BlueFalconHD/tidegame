execute if score #failed_class tide.salvage.tmp matches ..1 run scoreboard players set #failed_class tide.salvage.tmp 2
function tide:item/crowbar/pry/failure/create
execute positioned ~0.5 ~0.5 ~0.5 as @e[type=minecraft:item_display,tag=tide.salvage.damage,distance=..0.1,sort=nearest,limit=1] run scoreboard players add @s tide.salvage.attempts 1
execute positioned ~0.5 ~0.5 ~0.5 as @e[type=minecraft:item_display,tag=tide.salvage.damage,distance=..0.1,sort=nearest,limit=1] run function tide:item/crowbar/pry/failure/update_firm
particle minecraft:scrape ~0.5 ~0.5 ~0.5 0.12 0.12 0.12 0.02 2 normal
