scoreboard players set @s tide.worldgen.map.attempt 0
execute store result score @s tide.worldgen.map.rotation run random value 0..3
data modify entity @s data.rotation set value "none"
execute if score @s tide.worldgen.map.rotation matches 1 run data modify entity @s data.rotation set value "clockwise_90"
execute if score @s tide.worldgen.map.rotation matches 2 run data modify entity @s data.rotation set value "180"
execute if score @s tide.worldgen.map.rotation matches 3 run data modify entity @s data.rotation set value "counterclockwise_90"
execute if score @s tide.worldgen.map.rotation matches 1 run function tide:worldgen/map/layout/candidate/rotate
execute if score @s tide.worldgen.map.rotation matches 3 run function tide:worldgen/map/layout/candidate/rotate
return run function tide:worldgen/map/layout/candidate/roll
