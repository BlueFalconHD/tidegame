scoreboard players reset @s tide.player.island.fade

execute if score @s tide.player.island.state matches 2 run return run function tide:player/island/after_fade/success
execute if score @s tide.player.island.state matches 3 run return run function tide:player/island/after_fade/failure

return 0
