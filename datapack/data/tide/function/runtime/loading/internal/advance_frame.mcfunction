scoreboard players set @s tide.loading.frame_timer 0
scoreboard players add @s tide.loading.frame 1
execute if score @s tide.loading.frame matches 8.. run scoreboard players set @s tide.loading.frame 0

function tide:runtime/loading/internal/render
return 1

