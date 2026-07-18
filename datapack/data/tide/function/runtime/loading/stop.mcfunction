execute unless score @s tide.loading.state matches 1..2 run return 0

scoreboard players set @s tide.loading.state 3
scoreboard players set @s tide.loading.timer 10

title @s times 0 0 10
function tide:runtime/loading/internal/render
title @s title {"text":"\ue000","font":"tide:transition","shadow_color":0}

return 1

