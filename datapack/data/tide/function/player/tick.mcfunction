scoreboard players add @a tide.island.leaves 0
execute as @a unless score @s tide.island.seen_leaves = @s tide.island.leaves run function tide:island/internal/validate_membership
execute as @a unless score @s tide.island.seen_leaves = @s tide.island.leaves run scoreboard players operation @s tide.island.seen_leaves = @s tide.island.leaves

execute as @a[tag=tide.island.has_island,scores={tide.player.island.state=1}] run function tide:player/island/internal/wait_for_generation
execute as @a[scores={tide.player.island.fade=1..}] run function tide:player/island/internal/fade_tick
