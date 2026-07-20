# Remove leaked rename tokens without scanning every player's inventory every tick.
clear @a[tag=!tide.island.renaming] minecraft:name_tag[minecraft:custom_data~{tide:{island_name_token:true}}]

# Resume polling if an active renamer reconnects after the short-lived poll loop stopped.
execute if entity @a[tag=tide.island.renaming] run schedule function tide:island/name/internal/poll 1t replace
schedule function tide:island/name/internal/maintenance 20t replace
