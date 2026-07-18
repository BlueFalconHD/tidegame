scoreboard players add @s tide.loading.frame_timer 1
scoreboard players add @s tide.loading.flavor_timer 1

execute if score @s tide.loading.flavor_timer matches 40.. run function tide:runtime/loading/internal/cycle_flavor
execute if score @s tide.loading.frame_timer matches 2.. run return run function tide:runtime/loading/internal/advance_frame

return 0
