data modify storage tide:social scratch.viewed.location set value "Unnamed Island"
scoreboard players operation #social_location_island tide.identifier.island = @s tide.location.island
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry,tag=!tide.island.destroying] if score @s tide.identifier.island = #social_location_island tide.identifier.island if data entity @s data.name run data modify storage tide:social scratch.viewed.location set from entity @s data.name
return 1
