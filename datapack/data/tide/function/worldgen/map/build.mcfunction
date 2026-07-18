# Queue every accepted structure in the current map for building.
scoreboard players set #build_started tide.worldgen.map.tmp 0
scoreboard players set #build_total tide.worldgen.map.tmp 0

execute in minecraft:overworld run tag @e[type=minecraft:marker,tag=tide.worldgen.map.controller] remove tide.worldgen.map.build_pending
execute in minecraft:overworld run tag @e[type=minecraft:marker,tag=tide.worldgen.map.controller,tag=tide.worldgen.map.accepted] add tide.worldgen.map.build_pending
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.worldgen.map.controller,tag=tide.worldgen.map.accepted] run scoreboard players add #build_total tide.worldgen.map.tmp 1

title @a[tag=tide.dev.worldgen_debug] actionbar [{"text":"Building ","color":"#D0A8FF"},{"score":{"name":"#build_started","objective":"tide.worldgen.map.tmp"},"color":"#D0A8FF"},{"text":"/","color":"#D0A8FF"},{"score":{"name":"#build_total","objective":"tide.worldgen.map.tmp"},"color":"#D0A8FF"}]
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.worldgen.map.controller,tag=tide.worldgen.map.accepted] run function tide:worldgen/map/structure/build
return 1
