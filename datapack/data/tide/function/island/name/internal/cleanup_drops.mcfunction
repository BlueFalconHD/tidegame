execute as @e[type=minecraft:item,tag=!tide.island.name.token,distance=..4] if items entity @s contents minecraft:name_tag[minecraft:custom_data~{tide:{island_name_token:true}}] run tag @s add tide.island.name.token
execute as @e[type=minecraft:item,tag=tide.island.name.token,distance=..4] at @s as @a[tag=tide.island.renaming,distance=..4,sort=nearest,limit=1] run function tide:island/name/internal/cancel
kill @e[type=minecraft:item,tag=tide.island.name.token,distance=..4]
