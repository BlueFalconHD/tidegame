execute if entity @s[tag=tide.worldgen.map.build_pending] run function tide:worldgen/map/progress/build_started

execute if entity @s[tag=tide.worldgen.map.islet] run return run function tide:worldgen/map/structure/build/islet
execute if entity @s[tag=tide.worldgen.map.trawler] run return run function tide:worldgen/map/structure/build/trawler
execute if entity @s[tag=tide.worldgen.map.abandoned_raft] run return run function tide:worldgen/map/structure/build/abandoned_raft
execute if entity @s[tag=tide.worldgen.map.buoy] run return run function tide:worldgen/map/structure/build/buoy
execute if entity @s[tag=tide.worldgen.map.outpost] run return run function tide:worldgen/map/structure/build/outpost
execute if entity @s[tag=tide.worldgen.map.buried_treasure] run return run function tide:worldgen/map/structure/build/buried_treasure
execute if entity @s[tag=tide.worldgen.map.reef] run return run function tide:worldgen/map/structure/build/reef
execute if entity @s[tag=tide.worldgen.map.ghost_ship] run return run function tide:worldgen/map/structure/build/ghost_ship
execute if entity @s[tag=tide.worldgen.map.shipwreck] run return run function tide:worldgen/map/structure/build/shipwreck
execute if entity @s[tag=tide.worldgen.map.sunken_city] run return run function tide:worldgen/map/structure/build/sunken_city
return fail
