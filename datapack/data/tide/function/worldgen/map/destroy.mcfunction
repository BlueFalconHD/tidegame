# Queue every accepted structure in the current map for destruction.
scoreboard players set #destroy_started tide.worldgen.map.tmp 0
scoreboard players set #destroy_total tide.worldgen.map.tmp 0

execute in minecraft:overworld run tag @e[type=minecraft:marker,tag=tide.worldgen.map.controller] remove tide.worldgen.map.destroy_pending
execute in minecraft:overworld run tag @e[type=minecraft:marker,tag=tide.worldgen.map.controller,tag=tide.worldgen.map.accepted] add tide.worldgen.map.destroy_pending
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.worldgen.map.controller,tag=tide.worldgen.map.accepted] run scoreboard players add #destroy_total tide.worldgen.map.tmp 1

title @a[tag=tide.dev.worldgen_debug] actionbar [{"text":"Destroying "},{"score":{"name":"#destroy_started","objective":"tide.worldgen.map.tmp"}},{"text":"/"},{"score":{"name":"#destroy_total","objective":"tide.worldgen.map.tmp"}}]
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.worldgen.map.controller,tag=tide.worldgen.map.accepted] run function tide:worldgen/map/structure/destroy
return 1
