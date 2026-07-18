$execute if data storage tide:raft scratch.seen[{island:$(island)}] run return 0

scoreboard players set #travel_eligible tide.raft.tmp 0
scoreboard players set #travel_owner tide.identifier.player -1
data modify storage tide:raft scratch.destination set value {name:"Unnamed Island",owner:-1,owner_name:"Unknown Player"}
$execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry,tag=!tide.island.destroying] if score @s tide.identifier.island matches $(island) if score @s tide.island.state matches 2 if score @s tide.raft.state matches 1 run function tide:island/raft/destination/list/read_registry
execute unless score #travel_eligible tide.raft.tmp matches 1 run return 0

scoreboard players set #travel_owner_found tide.raft.tmp 0
data modify storage tide:raft scratch.owner set value {}
data modify storage tide:raft scratch.lookup set value {}
execute store result storage tide:raft scratch.lookup.id int 1 run scoreboard players get #travel_owner tide.identifier.player
function tide:island/raft/destination/list/load_owner with storage tide:raft scratch.lookup
execute unless score #travel_owner_found tide.raft.tmp matches 1 run return 0
data modify storage tide:raft scratch.destination.owner_name set from storage tide:raft scratch.owner.name

scoreboard players operation #travel_action tide.raft.tmp = #travel_candidate tide.identifier.island
scoreboard players add #travel_action tide.raft.tmp 1
execute store result storage tide:raft scratch.destination.action_target int 1 run scoreboard players get #travel_action tide.raft.tmp

$data modify storage tide:raft scratch.seen append value {island:$(island)}
function tide:island/raft/destination/list/render with storage tide:raft scratch.destination
scoreboard players add #travel_entries tide.raft.tmp 1
return 1
