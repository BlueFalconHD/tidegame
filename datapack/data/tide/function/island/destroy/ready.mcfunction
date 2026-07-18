$scoreboard players set #destroy_island tide.identifier.island $(island)
$scoreboard players set #destroy_owner tide.identifier.player $(owner)

# Move visitors to the center of the open ocean before removing the island.
tag @a remove tide.island.destroy.evacuate
execute positioned ~ ~-64 ~ run tag @a[dx=127,dy=384,dz=127] add tide.island.destroy.evacuate
execute in tide:ocean positioned 0 0 0 positioned over world_surface run tp @a[tag=tide.island.destroy.evacuate] ~ ~1 ~
execute as @a[tag=tide.island.destroy.evacuate] at @s run function tide:world/location/update
tag @a remove tide.island.destroy.evacuate

# Remove every non-player entity and every block in the island's complete build column.
execute positioned ~ ~-64 ~ run kill @e[type=!minecraft:player,dx=127,dy=384,dz=127]
scoreboard players set #destroy_strip tide.island.tmp 0
function tide:island/destroy/internal/clear

# Persistent profiles cover offline members; live player state is cleaned separately.
$data modify storage tide:social profiles[{island_id:$(island)}].has_island set value 0b
$data remove storage tide:social profiles[{island_id:$(island)}].island_id
execute as @a if score @s tide.identifier.island = #destroy_island tide.identifier.island run function tide:island/destroy/internal/cleanup_player

$data modify storage tide:island free_ids append value $(island)
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry] if score @s tide.identifier.island = #destroy_island tide.identifier.island run kill @s
return 1
