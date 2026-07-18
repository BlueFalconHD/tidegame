scoreboard players reset @s tide.island.rename

execute unless entity @s[tag=tide.island.has_island] run title @s actionbar {"text":"You are not a member of an island.","color":"#D94286"}
execute unless entity @s[tag=tide.island.has_island] run return fail
execute unless score @s tide.identifier.player matches 0.. run function tide:runtime/identifier/assign/player
execute unless entity @s[tag=tide.island.name.ready] run function tide:island/name/internal/ensure_player

scoreboard players operation #name_island tide.identifier.island = @s tide.identifier.island
scoreboard players operation #name_player tide.identifier.player = @s tide.identifier.player
scoreboard players set #name_rename_allowed tide.island.tmp 0

tag @a remove tide.island.name.source
tag @s add tide.island.name.source
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry,tag=!tide.island.destroying] if score @s tide.identifier.island = #name_island tide.identifier.island if score @s tide.island.owner = #name_player tide.identifier.player run function tide:island/name/internal/begin
tag @s remove tide.island.name.source

execute unless score #name_rename_allowed tide.island.tmp matches 1 run title @s actionbar {"text":"Only the island owner can rename it.","color":"#D94286"}
return run scoreboard players get #name_rename_allowed tide.island.tmp
