# The chunk-loading runtime invokes this in the overworld at the structure origin.
scoreboard players set #island_id tide.identifier.island -1
execute store result score #island_id tide.identifier.island run data get storage tide:chunkload active.island_id

scoreboard players set #island_found tide.island.tmp 0
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry] if score @s tide.identifier.island = #island_id tide.identifier.island run scoreboard players set #island_found tide.island.tmp 1
execute unless score #island_found tide.island.tmp matches 1 run return fail

scoreboard players set #placed tide.island.tmp 0
execute store success score #placed tide.island.tmp run place template tide:island/player_island ~ ~ ~ none

execute if score #placed tide.island.tmp matches 1 in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry] if score @s tide.identifier.island = #island_id tide.identifier.island run scoreboard players set @s tide.island.state 2
execute unless score #placed tide.island.tmp matches 1 in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry] if score @s tide.identifier.island = #island_id tide.identifier.island run scoreboard players set @s tide.island.state 3

execute if score #placed tide.island.tmp matches 1 run return 1
return fail
