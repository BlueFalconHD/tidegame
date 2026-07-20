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

scoreboard players set #travel_online tide.raft.tmp 0
execute as @a[tag=tide.island.has_island] if score @s tide.identifier.island = #travel_candidate tide.identifier.island run scoreboard players set #travel_online tide.raft.tmp 1
execute if score #travel_online tide.raft.tmp matches 1 run data modify storage tide:raft scratch.destination.status_marker set value "●"
execute if score #travel_online tide.raft.tmp matches 1 run data modify storage tide:raft scratch.destination.status_label set value "Online"
execute if score #travel_online tide.raft.tmp matches 1 run data modify storage tide:raft scratch.destination.status_color set value "#E0CA8E"
execute unless score #travel_online tide.raft.tmp matches 1 run data modify storage tide:raft scratch.destination.status_marker set value "○"
execute unless score #travel_online tide.raft.tmp matches 1 run data modify storage tide:raft scratch.destination.status_label set value "No members online"
execute unless score #travel_online tide.raft.tmp matches 1 run data modify storage tide:raft scratch.destination.status_color set value "gray"

scoreboard players operation #travel_action tide.raft.tmp = #travel_candidate tide.identifier.island
scoreboard players add #travel_action tide.raft.tmp 2
execute store result storage tide:raft scratch.destination.action_target int 1 run scoreboard players get #travel_action tide.raft.tmp

$data modify storage tide:raft scratch.seen append value {island:$(island)}
execute if score #travel_online tide.raft.tmp matches 1 run data modify storage tide:raft scratch.destinations.online append from storage tide:raft scratch.destination
execute unless score #travel_online tide.raft.tmp matches 1 run data modify storage tide:raft scratch.destinations.offline append from storage tide:raft scratch.destination
scoreboard players add #travel_entries tide.raft.tmp 1
return 1
