data modify storage tide:island scratch.rename set value {}
data modify storage tide:island scratch.rename.name set from entity @s Inventory[{id:"minecraft:name_tag",components:{"minecraft:custom_data":{tide:{island_name_token:true}}}}].components."minecraft:custom_name"

scoreboard players operation #name_island tide.identifier.island = @s tide.identifier.island
scoreboard players operation #name_player tide.identifier.player = @s tide.identifier.player
scoreboard players set #name_renamed tide.island.tmp 0
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry,tag=!tide.island.destroying] if score @s tide.identifier.island = #name_island tide.identifier.island if score @s tide.island.owner = #name_player tide.identifier.player run function tide:island/name/internal/apply

clear @s minecraft:name_tag[minecraft:custom_data~{tide:{island_name_token:true}}]
tag @s remove tide.island.renaming
inventory @s close

execute if score #name_renamed tide.island.tmp matches 1 run title @s actionbar [{"text":"Island renamed to ","color":"#F2F2F2"},{"nbt":"scratch.rename.name","storage":"tide:island","color":"#09C7E0"}]
execute unless score #name_renamed tide.island.tmp matches 1 run title @s actionbar {"text":"The island could not be renamed.","color":"#D94286"}
data remove storage tide:island scratch.rename
return run scoreboard players get #name_renamed tide.island.tmp
