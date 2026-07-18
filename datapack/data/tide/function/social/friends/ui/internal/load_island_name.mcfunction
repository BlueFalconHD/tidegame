data modify storage tide:social scratch.viewed.island_name set value {text:"Unnamed Island"}
scoreboard players set #social_viewed_island tide.identifier.island -1
execute store result score #social_viewed_island tide.identifier.island run data get storage tide:social scratch.viewed.island_id
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry] if score @s tide.identifier.island = #social_viewed_island tide.identifier.island if data entity @s data.name run data modify storage tide:social scratch.viewed.island_name set from entity @s data.name
