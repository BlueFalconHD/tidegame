execute if items entity @s weapon.mainhand minecraft:breeze_rod[minecraft:custom_data~{tide:{salvage_crowbar:1}},minecraft:damage=47] run return run function tide:item/crowbar/durability/break
item modify entity @s weapon.mainhand tide:item/crowbar/damage
