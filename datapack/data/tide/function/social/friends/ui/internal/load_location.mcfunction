function tide:world/location/update
data modify storage tide:social scratch.viewed.location set value "Outside Tide"
execute if score @s tide.location matches 1 run data modify storage tide:social scratch.viewed.location set value "Open Ocean"
execute if score @s tide.location matches 2 run function tide:social/friends/ui/internal/load_location_island
return 1
