execute unless entity @s[type=minecraft:player] run return fail

scoreboard players set #given tide.raft.tmp 0
execute store result score #given tide.raft.tmp run loot give @s loot tide:island/raft
execute unless score #given tide.raft.tmp matches 1 run loot spawn ~ ~ ~ loot tide:island/raft

return 1
