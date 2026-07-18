scoreboard players operation #raft_island tide.identifier.island = @s tide.identifier.island
execute as @e[type=minecraft:marker,tag=tide.island.registry] if score @s tide.identifier.island = #raft_island tide.identifier.island run function tide:island/raft/internal/unregister_island
execute as @e[type=minecraft:interaction,tag=tide.raft.interaction,distance=..4] if score @s tide.identifier.island = #raft_island tide.identifier.island run kill @s

loot spawn ~ ~ ~ loot tide:island/raft
playsound minecraft:entity.item.pickup player @a[tag=tide.raft.picker,limit=1] ~ ~ ~ 0.8 1.0
kill @s

return 1
