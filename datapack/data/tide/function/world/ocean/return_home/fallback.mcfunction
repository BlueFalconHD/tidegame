ride @s dismount
scoreboard players set #ocean_return_fallback tide.location.tmp 0
execute store result score #ocean_return_fallback tide.location.tmp run function tide:player/island/teleport
execute unless score #ocean_return_fallback tide.location.tmp matches 1 in tide:ocean positioned 0 0 0 positioned over world_surface run tp @s ~ ~1 ~
execute if score @s tide.loading.state matches 1..2 run function tide:runtime/loading/stop
function tide:world/ocean/return_home/internal/cleanup
execute at @s run function tide:world/location/update
execute if score #ocean_return_fallback tide.location.tmp matches 1 run title @s actionbar {"text":"Returned to your island; the home raft was unavailable.","color":"#F79317"}
execute unless score #ocean_return_fallback tide.location.tmp matches 1 run title @s actionbar {"text":"Your island could not be reached.","color":"#D94286"}
return run scoreboard players get #ocean_return_fallback tide.location.tmp
