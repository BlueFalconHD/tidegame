scoreboard players set @s tide.raft.age 0
execute store result score @s tide.raft.x run data get entity @s Pos[0]
execute store result score @s tide.raft.y run data get entity @s Pos[1]
execute store result score @s tide.raft.z run data get entity @s Pos[2]

# Resolve the island slot from the raft position.
scoreboard players operation #local_x tide.raft.tmp = @s tide.raft.x
scoreboard players operation #local_z tide.raft.tmp = @s tide.raft.z
scoreboard players operation #local_x tide.raft.tmp -= .base_x tide.island.tmp
scoreboard players operation #local_z tide.raft.tmp -= .base_z tide.island.tmp
execute unless score #local_x tide.raft.tmp matches 0.. run return run function tide:island/raft/internal/reject/outside
execute unless score #local_z tide.raft.tmp matches 0.. run return run function tide:island/raft/internal/reject/outside

scoreboard players operation #cell_x tide.raft.tmp = #local_x tide.raft.tmp
scoreboard players operation #cell_z tide.raft.tmp = #local_z tide.raft.tmp
scoreboard players operation #local_x tide.raft.tmp %= .slot_stride tide.island.tmp
scoreboard players operation #local_z tide.raft.tmp %= .slot_stride tide.island.tmp
scoreboard players operation #cell_x tide.raft.tmp /= .slot_stride tide.island.tmp
scoreboard players operation #cell_z tide.raft.tmp /= .slot_stride tide.island.tmp

# The generated structure occupies the first 128 by 128 blocks of its slot.
execute unless score #local_x tide.raft.tmp matches 0..127 run return run function tide:island/raft/internal/reject/outside
execute unless score #local_z tide.raft.tmp matches 0..127 run return run function tide:island/raft/internal/reject/outside

scoreboard players operation #raft_island tide.identifier.island = #cell_z tide.raft.tmp
scoreboard players operation #raft_island tide.identifier.island *= .grid_width tide.island.tmp
scoreboard players operation #raft_island tide.identifier.island += #cell_x tide.raft.tmp

# The island must exist, be generated, and belong to the placing player.
scoreboard players set #island_found tide.raft.tmp 0
execute as @e[type=minecraft:marker,tag=tide.island.registry] if score @s tide.identifier.island = #raft_island tide.identifier.island if score @s tide.island.state matches 2 run scoreboard players set #island_found tide.raft.tmp 1
execute unless score #island_found tide.raft.tmp matches 1 run return run function tide:island/raft/internal/reject/outside
execute unless score #placer_island tide.identifier.island = #raft_island tide.identifier.island run return run function tide:island/raft/internal/reject/not_member

# A registry score makes the one-raft rule work even while the deployed chunk is unloaded.
scoreboard players set #raft_available tide.raft.tmp 0
execute as @e[type=minecraft:marker,tag=tide.island.registry] if score @s tide.identifier.island = #raft_island tide.identifier.island unless score @s tide.raft.state matches 1 run scoreboard players set #raft_available tide.raft.tmp 1
execute unless score #raft_available tide.raft.tmp matches 1 run return run function tide:island/raft/internal/reject/duplicate

scoreboard players operation @s tide.identifier.island = #raft_island tide.identifier.island
scoreboard players operation #raft_x tide.raft.tmp = @s tide.raft.x
scoreboard players operation #raft_y tide.raft.tmp = @s tide.raft.y
scoreboard players operation #raft_z tide.raft.tmp = @s tide.raft.z
execute as @e[type=minecraft:marker,tag=tide.island.registry] if score @s tide.identifier.island = #raft_island tide.identifier.island run function tide:island/raft/internal/register_island

tag @s add tide.raft.registered
data merge entity @s {Invulnerable:1b,Motion:[0.0d,0.0d,0.0d]}

scoreboard players set #interaction_created tide.raft.tmp 0
execute store result score #interaction_created tide.raft.tmp run function tide:island/raft/internal/create_interaction
execute unless score #interaction_created tide.raft.tmp matches 1 as @e[type=minecraft:marker,tag=tide.island.registry] if score @s tide.identifier.island = #raft_island tide.identifier.island run function tide:island/raft/internal/unregister_island
execute unless score #interaction_created tide.raft.tmp matches 1 run return run function tide:island/raft/internal/reject/interaction

title @a[tag=tide.raft.placer,limit=1] actionbar [{"text":"Raft deployed. Punch to pick up.","color":"aqua"}]
playsound minecraft:entity.boat.paddle_water ambient @a[tag=tide.raft.placer,limit=1] ~ ~ ~ 0.8 1.0

return 1
