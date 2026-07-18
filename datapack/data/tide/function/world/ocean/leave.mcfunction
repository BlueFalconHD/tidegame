execute if entity @s[tag=tide.ocean.returning] run return 0
execute if entity @s[tag=tide.ocean.return.pending] run return 0

tag @s add tide.ocean.returning
scoreboard players set @s tide.area_transition 40
function tide:runtime/loading/start
return 1
