# Run as an accepted controller after its target chunks have been loaded.
execute unless entity @s[type=minecraft:marker,tag=tide.worldgen.map.controller,tag=tide.worldgen.map.accepted] run return fail

scoreboard players set #dispatch tide.worldgen.map.tmp 0
execute in tide:ocean run kill @e[type=minecraft:marker,tag=tide.worldgen.structure.cursor]
execute in tide:ocean run summon minecraft:marker 0 0 0 {Tags:["tide.worldgen.structure.cursor"]}
execute in tide:ocean store result entity @e[type=minecraft:marker,tag=tide.worldgen.structure.cursor,limit=1] Pos[0] double 1 run scoreboard players get @s tide.worldgen.map.place.x
execute in tide:ocean store result entity @e[type=minecraft:marker,tag=tide.worldgen.structure.cursor,limit=1] Pos[2] double 1 run scoreboard players get @s tide.worldgen.map.place.z
execute in tide:ocean positioned as @e[type=minecraft:marker,tag=tide.worldgen.structure.cursor,limit=1] store result score #dispatch tide.worldgen.map.tmp run function tide:worldgen/map/structure/destroy/dispatch
execute in tide:ocean run kill @e[type=minecraft:marker,tag=tide.worldgen.structure.cursor]
execute if score #dispatch tide.worldgen.map.tmp matches 1.. run return 1
return fail
