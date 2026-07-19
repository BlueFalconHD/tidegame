execute unless block ~ ~ ~ #tide:pryable run return 0

scoreboard players set #family tide.salvage.tmp 0
scoreboard players set #attempts tide.salvage.tmp 0
execute if block ~ ~ ~ #tide:family/timber run scoreboard players set #family tide.salvage.tmp 1
execute if block ~ ~ ~ #tide:family/metal run scoreboard players set #family tide.salvage.tmp 2
execute if block ~ ~ ~ #tide:family/stone run scoreboard players set #family tide.salvage.tmp 3
execute if block ~ ~ ~ #tide:family/fiber run scoreboard players set #family tide.salvage.tmp 4
execute positioned ~0.5 ~0.5 ~0.5 as @e[type=minecraft:item_display,tag=tide.salvage.damage,distance=..0.1,sort=nearest,limit=1] store result score #attempts tide.salvage.tmp run scoreboard players get @s tide.salvage.attempts

execute if block ~ ~ ~ minecraft:player_head run return run function tide:item/crowbar/pry/resolve/head
execute if block ~ ~ ~ #tide:toughness/soft run return run function tide:item/crowbar/pry/resolve/soft
execute if block ~ ~ ~ #tide:toughness/firm run return run function tide:item/crowbar/pry/resolve/firm
execute if block ~ ~ ~ #tide:toughness/tough run return run function tide:item/crowbar/pry/resolve/tough
