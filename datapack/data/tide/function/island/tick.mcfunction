execute as @a[tag=tide.island.has_island,tag=!tide.island.name.ready] run function tide:island/name/internal/ensure_player
execute as @a[scores={tide.island.rename=1..}] run function tide:island/name/start

scoreboard players enable @a tide.island.rename
