$execute unless data storage tide:social profiles[{id:$(id)}] run data modify storage tide:social profiles append value {id:$(id),name:"$(name)",has_island:0b}
$data modify storage tide:social profiles[{id:$(id)}].name set value "$(name)"
$execute if entity @s[tag=tide.island.has_island] run data modify storage tide:social profiles[{id:$(id)}].has_island set value 1b
$execute if entity @s[tag=tide.island.has_island] store result storage tide:social profiles[{id:$(id)}].island_id int 1 run scoreboard players get @s tide.identifier.island
$execute unless entity @s[tag=tide.island.has_island] run data modify storage tide:social profiles[{id:$(id)}].has_island set value 0b
$execute unless entity @s[tag=tide.island.has_island] run data remove storage tide:social profiles[{id:$(id)}].island_id
