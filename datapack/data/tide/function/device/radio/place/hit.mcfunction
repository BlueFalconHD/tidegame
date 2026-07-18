execute align xyz unless block ~ ~1 ~ minecraft:air run title @s actionbar {"text":"The radio needs an empty block above the surface.","color":"#D94286"}
execute align xyz unless block ~ ~1 ~ minecraft:air run return 0

execute align xyz positioned ~0.5 ~1 ~0.5 if entity @e[tag=tide.device.radio,distance=..0.75] run title @s actionbar {"text":"There is already a radio here.","color":"#F79317"}
execute align xyz positioned ~0.5 ~1 ~0.5 if entity @e[tag=tide.device.radio,distance=..0.75] run return 0

return run execute align xyz positioned ~0.5 ~1 ~0.5 run function tide:device/radio/place/create
