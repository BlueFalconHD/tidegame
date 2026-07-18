execute as @a[tag=tide.island.has_island,tag=!tide.island.name.ready] run function tide:island/name/internal/ensure_player
execute as @a[scores={tide.island.rename=1..}] run function tide:island/name/start
execute if entity @a[tag=tide.island.renaming] in minecraft:overworld run setblock 1 -64 0 minecraft:anvil
execute as @a[tag=tide.island.renaming] if data entity @s Inventory[{id:"minecraft:name_tag",components:{"minecraft:custom_data":{tide:{island_name_token:true}}}}].components."minecraft:custom_name" run function tide:island/name/complete

scoreboard players enable @a tide.island.rename
