scoreboard players set @s tide.loading.state 1
scoreboard players set @s tide.loading.timer 10
scoreboard players set @s tide.loading.frame 0
scoreboard players set @s tide.loading.frame_timer 0
scoreboard players set @s tide.loading.flavor_timer 0
execute store result score @s tide.loading.flavor run random value 0..11

title @s times 10 40 0
function tide:runtime/loading/internal/render
title @s title {"text":"\ue000","font":"tide:transition","shadow_color":0}

return 1
