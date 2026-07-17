function tide:worldgen/map/load

# Common salvage: 8 abandoned rafts
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/abandoned_raft
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/abandoned_raft
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/abandoned_raft
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/abandoned_raft
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/abandoned_raft
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/abandoned_raft
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/abandoned_raft
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/abandoned_raft

# Common salvage: 10 buoys
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/buoy
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/buoy
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/buoy
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/buoy
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/buoy
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/buoy
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/buoy
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/buoy
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/buoy
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/buoy

# Rare combat destination: 3 outposts
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/outpost
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/outpost
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/outpost

# Rare chained reward: 4 buried treasures
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/buried_treasure
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/buried_treasure
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/buried_treasure
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/buried_treasure

# Mid-frequency fishing destination: 6 reefs
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/reef
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/reef
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/reef
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/reef
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/reef
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/reef

# Rare combat salvage: 4 ghost ships
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/ghost_ship
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/ghost_ship
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/ghost_ship
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/ghost_ship

# Mid-frequency resource destination: 6 islets
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/islet
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/islet
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/islet
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/islet
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/islet
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/islet

# Common salvage: 7 shipwrecks
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/shipwreck
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/shipwreck
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/shipwreck
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/shipwreck
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/shipwreck
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/shipwreck
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/shipwreck

# Rare underwater destination: 3 sunken cities
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/sunken_city
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/sunken_city
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/sunken_city

# Mid-frequency fishing gear: 5 trawlers
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/trawler
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/trawler
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/trawler
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/trawler
execute summon minecraft:marker run function tide:worldgen/map/structure/assign/trawler

execute at @e[tag=tide.worldgen.map.center,limit=1] run tp @e[type=minecraft:marker,tag=tide.worldgen.map.controller] ~ ~ ~
execute at @e[tag=tide.worldgen.map.center,limit=1] run function tide:worldgen/map/randomize
