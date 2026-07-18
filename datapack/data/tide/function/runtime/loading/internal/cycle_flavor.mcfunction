scoreboard players set @s tide.loading.flavor_timer 0
scoreboard players add @s tide.loading.flavor 1
execute if score @s tide.loading.flavor matches 12.. run scoreboard players set @s tide.loading.flavor 0

return 1

