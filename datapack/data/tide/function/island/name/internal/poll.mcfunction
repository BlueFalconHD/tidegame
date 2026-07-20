# Player inventory NBT is intentionally polled only while a rename is active.
execute as @a[tag=tide.island.renaming] if data entity @s Inventory[{id:"minecraft:name_tag",components:{"minecraft:custom_data":{tide:{island_name_token:true}}}}].components."minecraft:custom_name" run function tide:island/name/complete
execute as @a[tag=tide.island.renaming] if data entity @s Inventory[{id:"minecraft:name_tag",components:{"minecraft:custom_data":{tide:{island_name_token:true}}}}] run function tide:island/name/internal/cancel

# Dropped-token checks stay local to active renamers instead of scanning every loaded item.
execute as @a[tag=tide.island.renaming] at @s run function tide:island/name/internal/cleanup_drops

execute if entity @a[tag=tide.island.renaming] run schedule function tide:island/name/internal/poll 4t replace
