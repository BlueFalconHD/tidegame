inventory @s close
clear @s minecraft:name_tag[minecraft:custom_data~{tide:{island_name_token:true}}]
tag @s remove tide.island.renaming
title @s actionbar {"text":"Island rename canceled.","color":"#D94286"}
return 1
