tag @s remove tide.worldgen.map.build_pending
scoreboard players add #build_started tide.worldgen.map.tmp 1
title @a[tag=tide.dev.worldgen_debug] actionbar [{"text":"Building "},{"score":{"name":"#build_started","objective":"tide.worldgen.map.tmp"}},{"text":"/"},{"score":{"name":"#build_total","objective":"tide.worldgen.map.tmp"}}]
return 1
