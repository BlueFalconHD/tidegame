execute as @a[tag=tide.island.has_island,scores={tide.player.island.state=1}] run function tide:player/island/internal/wait_for_generation
execute as @a[scores={tide.player.island.fade=1..}] run function tide:player/island/internal/fade_tick
