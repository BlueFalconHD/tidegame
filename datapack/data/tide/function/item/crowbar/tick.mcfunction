execute as @a if items entity @s weapon.mainhand minecraft:breeze_rod[minecraft:custom_data~{tide:{salvage_crowbar:1b}}] run item modify entity @s weapon.mainhand tide:item/crowbar/set_tier_int
execute as @a if items entity @s weapon.mainhand minecraft:breeze_rod[minecraft:custom_data~{tide:{salvage_crowbar:1}},minecraft:tool] run item modify entity @s weapon.mainhand tide:item/crowbar/remove_tool

scoreboard players remove @a[scores={tide.salvage.active=1..}] tide.salvage.active 1
scoreboard players reset @a[scores={tide.salvage.active=0}] tide.salvage.channel

execute in tide:ocean as @e[type=minecraft:item_display,tag=tide.salvage.damage] at @s unless block ~ ~ ~ #tide:pryable run kill @s
