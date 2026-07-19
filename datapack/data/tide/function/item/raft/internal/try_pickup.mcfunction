execute unless entity @s[tag=tide.island.has_island] run return fail

scoreboard players operation #picker_island tide.identifier.island = @s tide.identifier.island
tag @a remove tide.raft.picker
tag @s add tide.raft.picker

execute as @e[type=minecraft:bamboo_raft,tag=tide.raft.registered,distance=..2,sort=nearest,limit=1] if score @s tide.identifier.island = #picker_island tide.identifier.island at @s run function tide:item/raft/internal/pickup

tag @s remove tide.raft.picker
