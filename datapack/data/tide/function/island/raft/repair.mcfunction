execute unless entity @s[type=minecraft:player] run return fail
execute unless entity @s[tag=tide.island.has_island] run tellraw @s {"text":"You do not have an island to repair.","color":"#D94286"}
execute unless entity @s[tag=tide.island.has_island] run return fail

scoreboard players set #repair_island tide.identifier.island -1
scoreboard players operation #repair_island tide.identifier.island = @s tide.identifier.island
scoreboard players set #repair_player tide.identifier.player -1
scoreboard players operation #repair_player tide.identifier.player = @s tide.identifier.player

data remove storage tide:chunkload request
scoreboard players set #repair_prepared tide.raft.tmp 0
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry] if score @s tide.identifier.island = #repair_island tide.identifier.island store result score #repair_prepared tide.raft.tmp run function tide:island/raft/repair/internal/prepare
execute unless score #repair_prepared tide.raft.tmp matches 1 run tellraw @s {"text":"This island has no deployed raft state to repair.","color":"#F79317"}
execute unless score #repair_prepared tide.raft.tmp matches 1 run return fail

scoreboard players set #repair_enqueued tide.raft.tmp 0
execute store result score #repair_enqueued tide.raft.tmp run function tide:runtime/chunkload/enqueue
execute unless score #repair_enqueued tide.raft.tmp matches 1 run tellraw @s {"text":"Unable to queue the raft repair.","color":"#D94286"}
execute unless score #repair_enqueued tide.raft.tmp matches 1 run return fail

tellraw @s {"text":"Checking raft...","color":"#09C7E0"}
return 1
