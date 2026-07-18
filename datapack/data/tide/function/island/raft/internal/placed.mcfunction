scoreboard players set @s tide.raft.placed 0

tag @a remove tide.raft.placer
tag @s add tide.raft.placer
scoreboard players set #return_item tide.raft.tmp 0
execute unless entity @s[gamemode=creative] run scoreboard players set #return_item tide.raft.tmp 1
scoreboard players set #placer_island tide.identifier.island -1
scoreboard players operation #placer_island tide.identifier.island = @s tide.identifier.island

execute as @e[type=minecraft:bamboo_raft,tag=tide.raft,tag=!tide.raft.registered,distance=..6,sort=nearest,limit=1] at @s run function tide:island/raft/internal/register

tag @s remove tide.raft.placer
