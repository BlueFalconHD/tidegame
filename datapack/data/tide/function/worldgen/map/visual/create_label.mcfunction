$summon minecraft:text_display ~ ~0.35 ~ {Tags:["tide.worldgen.map","tide.worldgen.map.visual","tide.worldgen.map.visual.new"],billboard:"center",background:0,line_width:200,see_through:1b,shadow:1b,text:{text:"$(label)",color:"white"},view_range:64f}
execute store result score #visual_x tide.worldgen.map.tmp run data get entity @s Pos[0] 32
execute store result score #visual_z tide.worldgen.map.tmp run data get entity @s Pos[2] 32
scoreboard players operation #visual_x tide.worldgen.map.tmp += @s tide.worldgen.map.dim.x
scoreboard players operation #visual_z tide.worldgen.map.tmp += @s tide.worldgen.map.dim.z
execute store result entity @e[type=minecraft:text_display,tag=tide.worldgen.map.visual.new,sort=nearest,limit=1] Pos[0] double 0.03125 run scoreboard players get #visual_x tide.worldgen.map.tmp
execute store result entity @e[type=minecraft:text_display,tag=tide.worldgen.map.visual.new,sort=nearest,limit=1] Pos[2] double 0.03125 run scoreboard players get #visual_z tide.worldgen.map.tmp
tag @e[type=minecraft:text_display,tag=tide.worldgen.map.visual.new,sort=nearest,limit=1] remove tide.worldgen.map.visual.new
