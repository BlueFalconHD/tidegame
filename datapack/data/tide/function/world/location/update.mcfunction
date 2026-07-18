scoreboard players set @s tide.location 0
scoreboard players reset @s tide.location.island

execute if dimension tide:ocean run return run function tide:world/location/set_open_ocean
execute if dimension minecraft:overworld run return run function tide:world/location/detect_island
return 0
