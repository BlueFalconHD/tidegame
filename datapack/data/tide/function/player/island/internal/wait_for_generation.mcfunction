# Recreate the loading screen if this pending assignment has no active loader.
execute unless score @s tide.loading.state matches 1.. run function tide:runtime/loading/start
execute unless score @s tide.loading.state matches 2 run return 0

scoreboard players operation #island_id tide.identifier.island = @s tide.identifier.island
scoreboard players set #island_state tide.island.tmp -1
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry,tag=!tide.island.destroying] if score @s tide.identifier.island = #island_id tide.identifier.island run scoreboard players operation #island_state tide.island.tmp = @s tide.island.state

execute if score #island_state tide.island.tmp matches 2 run return run function tide:player/island/internal/arrive
execute if score #island_state tide.island.tmp matches 3 run return run function tide:player/island/internal/generation_failed
execute if score #island_state tide.island.tmp matches -1 run return run function tide:player/island/internal/generation_failed

return 0
