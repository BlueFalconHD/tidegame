scoreboard players operation #name_island tide.identifier.island = @s tide.identifier.island
scoreboard players operation #name_player tide.identifier.player = @s tide.identifier.player
scoreboard players set #name_record_found tide.island.tmp 0

tag @a remove tide.island.name.source
tag @s add tide.island.name.source
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry] if score @s tide.identifier.island = #name_island tide.identifier.island run function tide:island/name/internal/ensure_record
tag @s remove tide.island.name.source

execute if score #name_record_found tide.island.tmp matches 1 run tag @s add tide.island.name.ready
return run scoreboard players get #name_record_found tide.island.tmp
