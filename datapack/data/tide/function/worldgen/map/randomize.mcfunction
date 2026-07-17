execute as @e[type=minecraft:marker,tag=tide.worldgen.map.controller,tag=tide.worldgen.map.islet] run function tide:worldgen/map/structure/assign/islet
execute as @e[type=minecraft:marker,tag=tide.worldgen.map.controller,tag=tide.worldgen.map.sunken_city] run function tide:worldgen/map/structure/assign/sunken_city
execute as @e[type=minecraft:marker,tag=tide.worldgen.map.controller,tag=tide.worldgen.map.outpost] run function tide:worldgen/map/structure/assign/outpost
execute as @e[type=minecraft:marker,tag=tide.worldgen.map.controller,tag=tide.worldgen.map.ghost_ship] run function tide:worldgen/map/structure/assign/ghost_ship
execute as @e[type=minecraft:marker,tag=tide.worldgen.map.controller,tag=tide.worldgen.map.reef] run function tide:worldgen/map/structure/assign/reef
execute as @e[type=minecraft:marker,tag=tide.worldgen.map.controller,tag=tide.worldgen.map.trawler] run function tide:worldgen/map/structure/assign/trawler
execute as @e[type=minecraft:marker,tag=tide.worldgen.map.controller,tag=tide.worldgen.map.shipwreck] run function tide:worldgen/map/structure/assign/shipwreck
execute as @e[type=minecraft:marker,tag=tide.worldgen.map.controller,tag=tide.worldgen.map.abandoned_raft] run function tide:worldgen/map/structure/assign/abandoned_raft
execute as @e[type=minecraft:marker,tag=tide.worldgen.map.controller,tag=tide.worldgen.map.buried_treasure] run function tide:worldgen/map/structure/assign/buried_treasure
execute as @e[type=minecraft:marker,tag=tide.worldgen.map.controller,tag=tide.worldgen.map.buoy] run function tide:worldgen/map/structure/assign/buoy

function tide:worldgen/map/layout/start
function tide:worldgen/map/visual/render
return 1
