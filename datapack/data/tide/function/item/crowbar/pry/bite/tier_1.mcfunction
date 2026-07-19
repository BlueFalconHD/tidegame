scoreboard players set #timber tide.salvage.tmp 0
scoreboard players set #metal tide.salvage.tmp 0
scoreboard players set #stone tide.salvage.tmp 0
scoreboard players set #fiber tide.salvage.tmp 0
scoreboard players set #broken_class tide.salvage.tmp 0
scoreboard players set #failed_class tide.salvage.tmp 0

execute positioned ~-1 ~-1 ~-1 run function tide:item/crowbar/pry/resolve_block
execute positioned ~-1 ~-1 ~ run function tide:item/crowbar/pry/resolve_block
execute positioned ~-1 ~-1 ~1 run function tide:item/crowbar/pry/resolve_block
execute positioned ~-1 ~ ~-1 run function tide:item/crowbar/pry/resolve_block
execute positioned ~-1 ~ ~ run function tide:item/crowbar/pry/resolve_block
execute positioned ~-1 ~ ~1 run function tide:item/crowbar/pry/resolve_block
execute positioned ~-1 ~1 ~-1 run function tide:item/crowbar/pry/resolve_block
execute positioned ~-1 ~1 ~ run function tide:item/crowbar/pry/resolve_block
execute positioned ~-1 ~1 ~1 run function tide:item/crowbar/pry/resolve_block
execute positioned ~ ~-1 ~-1 run function tide:item/crowbar/pry/resolve_block
execute positioned ~ ~-1 ~ run function tide:item/crowbar/pry/resolve_block
execute positioned ~ ~-1 ~1 run function tide:item/crowbar/pry/resolve_block
execute positioned ~ ~ ~-1 run function tide:item/crowbar/pry/resolve_block
execute positioned ~ ~ ~ run function tide:item/crowbar/pry/resolve_block
execute positioned ~ ~ ~1 run function tide:item/crowbar/pry/resolve_block
execute positioned ~ ~1 ~-1 run function tide:item/crowbar/pry/resolve_block
execute positioned ~ ~1 ~ run function tide:item/crowbar/pry/resolve_block
execute positioned ~ ~1 ~1 run function tide:item/crowbar/pry/resolve_block
execute positioned ~1 ~-1 ~-1 run function tide:item/crowbar/pry/resolve_block
execute positioned ~1 ~-1 ~ run function tide:item/crowbar/pry/resolve_block
execute positioned ~1 ~-1 ~1 run function tide:item/crowbar/pry/resolve_block
execute positioned ~1 ~ ~-1 run function tide:item/crowbar/pry/resolve_block
execute positioned ~1 ~ ~ run function tide:item/crowbar/pry/resolve_block
execute positioned ~1 ~ ~1 run function tide:item/crowbar/pry/resolve_block
execute positioned ~1 ~1 ~-1 run function tide:item/crowbar/pry/resolve_block
execute positioned ~1 ~1 ~ run function tide:item/crowbar/pry/resolve_block
execute positioned ~1 ~1 ~1 run function tide:item/crowbar/pry/resolve_block

execute if score #timber tide.salvage.tmp matches 1.. run loot spawn ~0.5 ~0.5 ~0.5 loot tide:salvage/family/timber
execute if score #metal tide.salvage.tmp matches 1.. run loot spawn ~0.5 ~0.5 ~0.5 loot tide:salvage/family/metal
execute if score #stone tide.salvage.tmp matches 1.. run loot spawn ~0.5 ~0.5 ~0.5 loot tide:salvage/family/stone
execute if score #fiber tide.salvage.tmp matches 1.. run loot spawn ~0.5 ~0.5 ~0.5 loot tide:salvage/family/fiber

function tide:item/crowbar/pry/feedback
function tide:item/crowbar/durability/apply
