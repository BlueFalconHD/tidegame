scoreboard players set #interaction_summoned tide.raft.tmp 0
execute store success score #interaction_summoned tide.raft.tmp run summon minecraft:interaction ~ ~ ~ {width:1.6f,height:0.7f,response:0b,NoGravity:1b,Tags:["tide.raft.interaction","tide.raft.interaction.new"]}
execute unless score #interaction_summoned tide.raft.tmp matches 1 run return fail

scoreboard players operation @e[type=minecraft:interaction,tag=tide.raft.interaction.new,sort=nearest,limit=1] tide.identifier.island = @s tide.identifier.island
tag @e[type=minecraft:interaction,tag=tide.raft.interaction.new,sort=nearest,limit=1] remove tide.raft.interaction.new
tag @s add tide.raft.interaction_ready
return 1
