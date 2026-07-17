tag @s remove tide.worldgen.map.destroy_pending
scoreboard players add #destroy_started tide.worldgen.map.tmp 1
title @a[tag=tide.dev.worldgen_debug] actionbar [{"text":"Destroying "},{"score":{"name":"#destroy_started","objective":"tide.worldgen.map.tmp"}},{"text":"/"},{"score":{"name":"#destroy_total","objective":"tide.worldgen.map.tmp"}}]
return 1
