scoreboard objectives add tide.island.x dummy
scoreboard objectives add tide.island.y dummy
scoreboard objectives add tide.island.z dummy
scoreboard objectives add tide.island.state dummy
scoreboard objectives add tide.island.owner dummy
scoreboard objectives add tide.island.tmp dummy
scoreboard objectives add tide.island.rename trigger
scoreboard objectives add tide.island.leaves minecraft.custom:minecraft.leave_game
scoreboard objectives add tide.island.seen_leaves dummy

scoreboard players set .grid_width tide.island.tmp 1024
scoreboard players set .slot_stride tide.island.tmp 512
scoreboard players set .base_x tide.island.tmp 8192
scoreboard players set .base_z tide.island.tmp 8192
execute unless data storage tide:island free_ids run data modify storage tide:island free_ids set value []

# All persistent island records live together in this always-loaded chunk.
execute in minecraft:overworld run forceload add 0 0
execute in minecraft:overworld run setblock 1 -64 0 minecraft:anvil
tag @a remove tide.island.name.ready
schedule function tide:island/name/internal/maintenance 20t replace
execute if entity @a[tag=tide.island.renaming] run schedule function tide:island/name/internal/poll 1t replace

function tide:island/raft/load
