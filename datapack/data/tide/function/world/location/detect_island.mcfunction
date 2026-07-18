execute store result score #location_x tide.location.tmp run data get entity @s Pos[0] 1
execute store result score #location_z tide.location.tmp run data get entity @s Pos[2] 1

scoreboard players operation #location_x tide.location.tmp -= .base_x tide.island.tmp
scoreboard players operation #location_z tide.location.tmp -= .base_z tide.island.tmp
execute unless score #location_x tide.location.tmp matches 0.. run return 0
execute unless score #location_z tide.location.tmp matches 0.. run return 0

scoreboard players operation #location_cell_x tide.location.tmp = #location_x tide.location.tmp
scoreboard players operation #location_cell_z tide.location.tmp = #location_z tide.location.tmp
scoreboard players operation #location_cell_x tide.location.tmp /= .slot_stride tide.island.tmp
scoreboard players operation #location_cell_z tide.location.tmp /= .slot_stride tide.island.tmp
scoreboard players operation #location_x tide.location.tmp %= .slot_stride tide.island.tmp
scoreboard players operation #location_z tide.location.tmp %= .slot_stride tide.island.tmp
execute unless score #location_x tide.location.tmp matches 0..127 run return 0
execute unless score #location_z tide.location.tmp matches 0..127 run return 0

scoreboard players operation #location_island tide.identifier.island = #location_cell_z tide.location.tmp
scoreboard players operation #location_island tide.identifier.island *= .grid_width tide.island.tmp
scoreboard players operation #location_island tide.identifier.island += #location_cell_x tide.location.tmp

scoreboard players set #location_valid tide.location.tmp 0
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry,tag=!tide.island.destroying] if score @s tide.identifier.island = #location_island tide.identifier.island if score @s tide.island.state matches 2 run scoreboard players set #location_valid tide.location.tmp 1
execute unless score #location_valid tide.location.tmp matches 1 run return 0

scoreboard players set @s tide.location 2
scoreboard players operation @s tide.location.island = #location_island tide.identifier.island
return 1
