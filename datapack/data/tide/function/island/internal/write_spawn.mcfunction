scoreboard players operation #spawn_x tide.island.tmp = @s tide.island.x
scoreboard players operation #spawn_y tide.island.tmp = @s tide.island.y
scoreboard players operation #spawn_z tide.island.tmp = @s tide.island.z
scoreboard players add #spawn_x tide.island.tmp 63
scoreboard players add #spawn_y tide.island.tmp 15
scoreboard players add #spawn_z tide.island.tmp 52

data modify storage tide:island scratch.spawn set value {}
execute store result storage tide:island scratch.spawn.x int 1 run scoreboard players get #spawn_x tide.island.tmp
execute store result storage tide:island scratch.spawn.y int 1 run scoreboard players get #spawn_y tide.island.tmp
execute store result storage tide:island scratch.spawn.z int 1 run scoreboard players get #spawn_z tide.island.tmp

return 1
