execute unless entity @s[type=minecraft:player] run return fail
execute if entity @s[tag=tide.island.has_island] run tellraw @s {"text":"You already have an island.","color":"#D94286"}
execute if entity @s[tag=tide.island.has_island] run return fail

execute unless score @s tide.identifier.player matches 0.. run function tide:runtime/identifier/assign/player
function tide:runtime/loading/start

scoreboard players set #allocated tide.island.tmp 0
execute store result score #allocated tide.island.tmp run function tide:island/allocate
execute unless score #allocated tide.island.tmp matches 1 run function tide:runtime/loading/clear
execute unless score #allocated tide.island.tmp matches 1 run tellraw @s {"text":"Unable to allocate an island.","color":"#D94286"}
execute unless score #allocated tide.island.tmp matches 1 run return fail

scoreboard players set @s tide.player.island.state 1
scoreboard players reset @s tide.player.island.fade
scoreboard players operation #island_id tide.identifier.island = @s tide.identifier.island

scoreboard players set #enqueued tide.island.tmp 0
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry] if score @s tide.identifier.island = #island_id tide.identifier.island store result score #enqueued tide.island.tmp run function tide:worldgen/island/generate
execute unless score #enqueued tide.island.tmp matches 1 run function tide:player/island/internal/generation_failed
execute unless score #enqueued tide.island.tmp matches 1 run return fail

return 1
