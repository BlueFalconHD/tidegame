tag @s remove tide.worldgen.map.destroy_pending
scoreboard players add #destroy_started tide.worldgen.map.tmp 1
title @a[tag=tide.dev.worldgen_debug] actionbar [{"text":"Destroying ","color":"#D0A8FF"},{"score":{"name":"#destroy_started","objective":"tide.worldgen.map.tmp"},"color":"#D0A8FF"},{"text":"/","color":"#D0A8FF"},{"score":{"name":"#destroy_total","objective":"tide.worldgen.map.tmp"},"color":"#D0A8FF"}]
return 1
