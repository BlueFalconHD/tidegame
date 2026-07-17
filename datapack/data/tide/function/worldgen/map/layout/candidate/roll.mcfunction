scoreboard players add @s tide.worldgen.map.attempt 1
execute if score @s tide.worldgen.map.attempt matches 65.. run function tide:worldgen/map/layout/candidate/fail
execute if score @s tide.worldgen.map.attempt matches 65.. run return fail

execute store result score @s tide.worldgen.map.pos.x run random value -328..327
execute store result score @s tide.worldgen.map.pos.z run random value -328..327
function tide:worldgen/map/layout/candidate/calculate_bounds
function tide:worldgen/map/layout/candidate/validate
execute unless score #valid tide.worldgen.map.tmp matches 1 run return run function tide:worldgen/map/layout/candidate/roll
return run function tide:worldgen/map/layout/candidate/accept
