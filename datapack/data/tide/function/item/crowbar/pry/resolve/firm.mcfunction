execute if score #attempts tide.salvage.tmp matches 2.. run return run function tide:item/crowbar/pry/success/firm

execute store result score #roll tide.salvage.tmp run random value 1..2
execute if score #roll tide.salvage.tmp matches 1 run return run function tide:item/crowbar/pry/success/firm
return run function tide:item/crowbar/pry/failure/firm
