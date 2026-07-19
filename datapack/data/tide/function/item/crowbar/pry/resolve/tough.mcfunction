execute if score #attempts tide.salvage.tmp matches 4.. run return run function tide:item/crowbar/pry/success/tough

execute store result score #roll tide.salvage.tmp run random value 1..4
execute if score #roll tide.salvage.tmp matches 1 run return run function tide:item/crowbar/pry/success/tough
return run function tide:item/crowbar/pry/failure/tough
