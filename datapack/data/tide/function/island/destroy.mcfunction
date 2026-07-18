execute unless entity @s[type=minecraft:player] run return fail
execute unless entity @s[tag=tide.island.has_island] run title @s actionbar {"text":"You do not have an island to destroy.","color":"#D94286"}
execute unless entity @s[tag=tide.island.has_island] run return fail
execute unless score @s tide.identifier.player matches 0.. run function tide:runtime/identifier/assign/player

scoreboard players operation #destroy_island tide.identifier.island = @s tide.identifier.island
scoreboard players operation #destroy_player tide.identifier.player = @s tide.identifier.player
scoreboard players set #destroy_found tide.island.tmp 0
scoreboard players set #destroy_permitted tide.island.tmp 0
scoreboard players set #destroy_busy tide.island.tmp 0
scoreboard players set #destroy_enqueued tide.island.tmp 0

execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry] if score @s tide.identifier.island = #destroy_island tide.identifier.island run scoreboard players set #destroy_found tide.island.tmp 1
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry] if score @s tide.identifier.island = #destroy_island tide.identifier.island if score @s tide.island.owner = #destroy_player tide.identifier.player run scoreboard players set #destroy_permitted tide.island.tmp 1
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry,tag=tide.island.destroying] if score @s tide.identifier.island = #destroy_island tide.identifier.island run scoreboard players set #destroy_busy tide.island.tmp 1

execute unless score #destroy_found tide.island.tmp matches 1 run title @s actionbar {"text":"Your island registry record could not be found.","color":"#D94286"}
execute unless score #destroy_found tide.island.tmp matches 1 run return fail
execute unless score #destroy_permitted tide.island.tmp matches 1 run title @s actionbar {"text":"Only the island owner can destroy it.","color":"#D94286"}
execute unless score #destroy_permitted tide.island.tmp matches 1 run return fail
execute if score #destroy_busy tide.island.tmp matches 1 run title @s actionbar {"text":"That island is already being destroyed.","color":"#F79317"}
execute if score #destroy_busy tide.island.tmp matches 1 run return fail

execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry] if score @s tide.identifier.island = #destroy_island tide.identifier.island if score @s tide.island.owner = #destroy_player tide.identifier.player store result score #destroy_enqueued tide.island.tmp run function tide:island/destroy/internal/prepare
execute unless score #destroy_enqueued tide.island.tmp matches 1 run title @s actionbar {"text":"The island could not be queued for destruction.","color":"#D94286"}
execute unless score #destroy_enqueued tide.island.tmp matches 1 run return fail

title @s actionbar {"text":"Island destruction queued…","color":"#E0CA8E"}
return 1
