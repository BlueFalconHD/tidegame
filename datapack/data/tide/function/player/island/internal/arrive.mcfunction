scoreboard players operation #island_id tide.identifier.island = @s tide.identifier.island
scoreboard players set #spawn_found tide.island.tmp 0
data remove storage tide:island scratch
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry] if score @s tide.identifier.island = #island_id tide.identifier.island store result score #spawn_found tide.island.tmp run function tide:island/internal/write_spawn
execute unless score #spawn_found tide.island.tmp matches 1 run return run function tide:player/island/internal/generation_failed

scoreboard players set #teleported tide.island.tmp 0
execute store result score #teleported tide.island.tmp run function tide:player/island/internal/teleport with storage tide:island scratch.spawn
data remove storage tide:island scratch
execute unless score #teleported tide.island.tmp matches 1 run return run function tide:player/island/internal/generation_failed

function tide:runtime/loading/stop
scoreboard players set @s tide.player.island.state 2
scoreboard players set @s tide.player.island.fade 10

return 1
