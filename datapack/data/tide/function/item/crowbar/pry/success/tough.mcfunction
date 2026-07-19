execute if score #family tide.salvage.tmp matches 1 run scoreboard players add #timber tide.salvage.tmp 1
execute if score #family tide.salvage.tmp matches 2 run scoreboard players add #metal tide.salvage.tmp 1
execute if score #family tide.salvage.tmp matches 3 run scoreboard players add #stone tide.salvage.tmp 1
execute if score #family tide.salvage.tmp matches 4 run scoreboard players add #fiber tide.salvage.tmp 1
scoreboard players set #broken_class tide.salvage.tmp 3

particle minecraft:smoke ~0.5 ~0.5 ~0.5 0.2 0.2 0.2 0.03 4 normal
function tide:item/crowbar/pry/success/finish
