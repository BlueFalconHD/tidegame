scoreboard players remove @s tide.loading.timer 1
execute if score @s tide.loading.timer matches 1.. run return 0

scoreboard players set @s tide.loading.state 2
scoreboard players set @s tide.loading.timer 0

return 1

