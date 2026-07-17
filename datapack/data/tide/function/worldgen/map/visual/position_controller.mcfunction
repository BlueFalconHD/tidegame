# Project the authoritative ocean position onto the miniature map at 1:16 scale.
execute store result score #visual_x tide.worldgen.map.tmp run data get entity @e[tag=tide.worldgen.map.center,limit=1] Pos[0] 16
execute store result score #visual_z tide.worldgen.map.tmp run data get entity @e[tag=tide.worldgen.map.center,limit=1] Pos[2] 16
scoreboard players operation #visual_x tide.worldgen.map.tmp += @s tide.worldgen.map.pos.x
scoreboard players operation #visual_z tide.worldgen.map.tmp += @s tide.worldgen.map.pos.z
execute store result entity @s Pos[0] double 0.0625 run scoreboard players get #visual_x tide.worldgen.map.tmp
execute store result entity @s Pos[2] double 0.0625 run scoreboard players get #visual_z tide.worldgen.map.tmp
return 1
