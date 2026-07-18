scoreboard players remove @s tide.loading.timer 1
execute if score @s tide.loading.timer matches 1.. run return 0

function tide:runtime/loading/clear
return 1
