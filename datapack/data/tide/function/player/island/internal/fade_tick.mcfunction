scoreboard players remove @s tide.player.island.fade 1
execute if score @s tide.player.island.fade matches 1.. run return 0

return run function tide:player/island/after_fade
