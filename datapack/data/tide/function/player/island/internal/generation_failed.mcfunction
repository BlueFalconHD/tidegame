execute if score @s tide.loading.state matches 1.. run function tide:runtime/loading/stop
scoreboard players set @s tide.player.island.state 3
scoreboard players set @s tide.player.island.fade 10

return 1
