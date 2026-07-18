execute unless entity @s[type=minecraft:player] run return fail
execute unless entity @s[tag=tide.island.has_island] run tellraw @s {"text":"You do not have an island.","color":"red"}
execute unless entity @s[tag=tide.island.has_island] run return fail

scoreboard players set #island_id tide.identifier.island -1
scoreboard players operation #island_id tide.identifier.island = @s tide.identifier.island
scoreboard players set #spawn_found tide.island.tmp 0
data remove storage tide:island scratch
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry] if score @s tide.identifier.island = #island_id tide.identifier.island if score @s tide.island.state matches 2 store result score #spawn_found tide.island.tmp run function tide:island/internal/write_spawn

execute unless score #spawn_found tide.island.tmp matches 1 run data remove storage tide:island scratch
execute unless score #spawn_found tide.island.tmp matches 1 run tellraw @s {"text":"Your island is not ready yet.","color":"red"}
execute unless score #spawn_found tide.island.tmp matches 1 run return fail

scoreboard players set #teleported tide.island.tmp 0
execute store result score #teleported tide.island.tmp run function tide:player/island/internal/teleport with storage tide:island scratch.spawn
data remove storage tide:island scratch
execute unless score #teleported tide.island.tmp matches 1 run tellraw @s {"text":"Unable to teleport to your island.","color":"red"}
execute unless score #teleported tide.island.tmp matches 1 run return fail

return 1
