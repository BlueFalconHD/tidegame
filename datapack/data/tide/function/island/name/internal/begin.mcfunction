scoreboard players set #name_rename_allowed tide.island.tmp 1

scoreboard players set #name_levels tide.island.tmp 0
execute as @a[tag=tide.island.name.source,limit=1] store result score #name_levels tide.island.tmp run experience query @s levels
execute unless score #name_levels tide.island.tmp matches 1.. unless entity @a[tag=tide.island.name.source,gamemode=creative,limit=1] run title @a[tag=tide.island.name.source,limit=1] actionbar {"text":"Renaming an island requires 1 experience level.","color":"#D94286"}
execute unless score #name_levels tide.island.tmp matches 1.. unless entity @a[tag=tide.island.name.source,gamemode=creative,limit=1] run return fail

inventory @a[tag=tide.island.name.source,limit=1] close
clear @a[tag=tide.island.name.source,limit=1] minecraft:name_tag[minecraft:custom_data~{tide:{island_name_token:true}}]
scoreboard players set #name_token_given tide.island.tmp 0
execute store result score #name_token_given tide.island.tmp run loot give @a[tag=tide.island.name.source,limit=1] loot tide:island/name/token
execute unless score #name_token_given tide.island.tmp matches 1 run title @a[tag=tide.island.name.source,limit=1] actionbar {"text":"Make room in your inventory first.","color":"#D94286"}
execute unless score #name_token_given tide.island.tmp matches 1 run return fail

tag @a[tag=tide.island.name.source,limit=1] add tide.island.renaming

# Tide owns this GUI anvil in the already-forceloaded registry chunk.
execute in minecraft:overworld run setblock 1 -64 0 minecraft:anvil
execute in minecraft:overworld positioned 1 -64 0 run inventory @a[tag=tide.island.name.source,limit=1] block ~ ~ ~ Rename Island
title @a[tag=tide.island.name.source,limit=1] actionbar {"text":"Rename the name tag and take the result (costs 1 level).","color":"#E0CA8E"}
return 1
