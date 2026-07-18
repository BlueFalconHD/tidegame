# Map the sequential island ID onto a 1024-column grid.
scoreboard players operation @s tide.island.x = @s tide.identifier.island
scoreboard players operation @s tide.island.x %= .grid_width tide.island.tmp
scoreboard players operation @s tide.island.x *= .slot_stride tide.island.tmp
scoreboard players operation @s tide.island.x += .base_x tide.island.tmp

scoreboard players operation @s tide.island.z = @s tide.identifier.island
scoreboard players operation @s tide.island.z /= .grid_width tide.island.tmp
scoreboard players operation @s tide.island.z *= .slot_stride tide.island.tmp
scoreboard players operation @s tide.island.z += .base_z tide.island.tmp

scoreboard players set @s tide.island.y 0

return 1
