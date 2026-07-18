scoreboard players operation #island_id tide.identifier.island = @s tide.identifier.island
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry] if score @s tide.identifier.island = #island_id tide.identifier.island if score @s tide.island.state matches 3 run kill @s

tag @s remove tide.island.has_island
scoreboard players reset @s tide.identifier.island
scoreboard players set @s tide.player.island.state 0
tellraw @s {"text":"Your island could not be generated.","color":"red"}

return 1
