execute if score @s tide.loading.state matches 1..2 run function tide:runtime/loading/stop
tag @s remove tide.ocean.return.settling
scoreboard players set @s tide.area_transition 0
title @s actionbar {"text":"Welcome home","color":"#E0CA8E"}
return 1
