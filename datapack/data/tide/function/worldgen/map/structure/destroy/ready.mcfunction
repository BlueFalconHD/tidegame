# The chunkload callback enters here in tide:ocean at the placement anchor.
scoreboard players set #structure_id tide.identifier.structure -1
execute store result score #structure_id tide.identifier.structure run data get storage tide:chunkload active.structure_id
scoreboard players set #dispatch tide.worldgen.map.tmp 0
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.worldgen.map.controller,tag=tide.worldgen.map.accepted] if score @s tide.identifier.structure = #structure_id tide.identifier.structure in tide:ocean store result score #dispatch tide.worldgen.map.tmp run function tide:worldgen/map/structure/destroy/dispatch
execute if score #dispatch tide.worldgen.map.tmp matches 1.. run return 1
return fail
