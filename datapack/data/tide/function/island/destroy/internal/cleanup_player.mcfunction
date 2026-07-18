execute if entity @s[tag=tide.raft.travel.session] run function tide:island/raft/destination/internal/expire
execute if entity @s[tag=tide.raft.travel.departing] run function tide:island/raft/destination/internal/expire
execute if entity @s[tag=tide.raft.travel.pending] run function tide:island/raft/destination/internal/expire
execute if score @s tide.player.island.state matches 1 if score @s tide.loading.state matches 1.. run function tide:runtime/loading/clear

execute if entity @s[tag=tide.island.renaming] run inventory @s close
clear @s minecraft:name_tag[minecraft:custom_data~{tide:{island_name_token:true}}]
tag @s remove tide.island.has_island
tag @s remove tide.island.name.ready
tag @s remove tide.island.renaming
scoreboard players reset @s tide.identifier.island
scoreboard players set @s tide.player.island.state 0
scoreboard players reset @s tide.player.island.fade
scoreboard players reset @s tide.island.rename
function tide:social/profile/sync

execute if score @s tide.identifier.player = #destroy_owner tide.identifier.player run title @s actionbar {"text":"Your island was destroyed and unallocated.","color":"#E0CA8E"}
execute unless score @s tide.identifier.player = #destroy_owner tide.identifier.player run title @s actionbar {"text":"The island you belonged to was destroyed.","color":"#D94286"}
return 1
