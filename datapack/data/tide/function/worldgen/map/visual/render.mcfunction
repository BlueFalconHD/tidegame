kill @e[tag=tide.worldgen.map.visual]
execute unless entity @e[tag=tide.worldgen.map.center,limit=1] run return fail
execute as @e[type=minecraft:marker,tag=tide.worldgen.map.controller,tag=tide.worldgen.map.accepted] run function tide:worldgen/map/visual/position_controller
execute as @e[type=minecraft:marker,tag=tide.worldgen.map.controller,tag=tide.worldgen.map.accepted] run function tide:worldgen/map/visual/create
return 1
