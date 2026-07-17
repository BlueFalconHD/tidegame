tag @e[type=minecraft:marker,tag=tide.worldgen.map.controller] remove tide.worldgen.map.accepted
tag @e[type=minecraft:marker,tag=tide.worldgen.map.controller] remove tide.worldgen.map.failed
tag @e[type=minecraft:marker,tag=tide.worldgen.map.controller] add tide.worldgen.map.pending

scoreboard players set #map_min tide.worldgen.map.tmp -328
scoreboard players set #map_max tide.worldgen.map.tmp 327

# Reserve larger padded footprints first.
execute as @e[type=minecraft:marker,tag=tide.worldgen.map.pending,tag=tide.worldgen.map.islet] run function tide:worldgen/map/layout/candidate/start
execute as @e[type=minecraft:marker,tag=tide.worldgen.map.pending,tag=tide.worldgen.map.sunken_city] run function tide:worldgen/map/layout/candidate/start
execute as @e[type=minecraft:marker,tag=tide.worldgen.map.pending,tag=tide.worldgen.map.ghost_ship] run function tide:worldgen/map/layout/candidate/start
execute as @e[type=minecraft:marker,tag=tide.worldgen.map.pending,tag=tide.worldgen.map.outpost] run function tide:worldgen/map/layout/candidate/start
execute as @e[type=minecraft:marker,tag=tide.worldgen.map.pending,tag=tide.worldgen.map.reef] run function tide:worldgen/map/layout/candidate/start
execute as @e[type=minecraft:marker,tag=tide.worldgen.map.pending,tag=tide.worldgen.map.shipwreck] run function tide:worldgen/map/layout/candidate/start
execute as @e[type=minecraft:marker,tag=tide.worldgen.map.pending,tag=tide.worldgen.map.trawler] run function tide:worldgen/map/layout/candidate/start
execute as @e[type=minecraft:marker,tag=tide.worldgen.map.pending,tag=tide.worldgen.map.buried_treasure] run function tide:worldgen/map/layout/candidate/start
execute as @e[type=minecraft:marker,tag=tide.worldgen.map.pending,tag=tide.worldgen.map.abandoned_raft] run function tide:worldgen/map/layout/candidate/start
execute as @e[type=minecraft:marker,tag=tide.worldgen.map.pending,tag=tide.worldgen.map.buoy] run function tide:worldgen/map/layout/candidate/start

execute if entity @e[type=minecraft:marker,tag=tide.worldgen.map.failed] run tellraw @a {text:"Tide map layout could not place every structure.",color:"red"}
return 1
