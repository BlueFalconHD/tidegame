scoreboard players set #name_record_found tide.island.tmp 1
execute unless score @s tide.island.owner matches 0.. run scoreboard players operation @s tide.island.owner = #name_player tide.identifier.player

scoreboard players set #name_missing tide.island.tmp 0
execute unless data entity @s data.name run scoreboard players set #name_missing tide.island.tmp 1
execute if score #name_missing tide.island.tmp matches 1 run data modify storage tide:island scratch.default_name set value {creator:"Unknown Player"}
execute if score #name_missing tide.island.tmp matches 1 run data modify storage tide:island scratch.default_name.creator set from entity @a[tag=tide.island.name.source,limit=1] bukkit.lastKnownName
execute if score #name_missing tide.island.tmp matches 1 run function tide:island/name/internal/set_default with storage tide:island scratch.default_name
execute if score #name_missing tide.island.tmp matches 1 run data remove storage tide:island scratch.default_name
return 1
