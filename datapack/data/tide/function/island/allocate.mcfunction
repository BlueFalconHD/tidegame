execute unless entity @s[type=minecraft:player] run return fail
execute if entity @s[tag=tide.island.has_island] run return fail

# A stale temporary tag must never make a newly summoned record ambiguous.
execute in minecraft:overworld run tag @e[type=minecraft:marker,tag=tide.island.registry,tag=tide.island.new] remove tide.island.new

scoreboard players set #summoned tide.island.tmp 0
execute in minecraft:overworld positioned 0 -64 0 store success score #summoned tide.island.tmp run summon minecraft:marker ~ ~ ~ {Tags:["tide.island.registry","tide.island.new"]}
execute unless score #summoned tide.island.tmp matches 1 run return fail

scoreboard players set #initialized tide.island.tmp 0
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry,tag=tide.island.new,limit=1] store result score #initialized tide.island.tmp run function tide:island/internal/initialize
execute unless score #initialized tide.island.tmp matches 1 in minecraft:overworld run kill @e[type=minecraft:marker,tag=tide.island.registry,tag=tide.island.new,limit=1]
execute unless score #initialized tide.island.tmp matches 1 run return fail

execute in minecraft:overworld run scoreboard players operation @e[type=minecraft:marker,tag=tide.island.registry,tag=tide.island.new,limit=1] tide.island.owner = @s tide.identifier.player
data modify storage tide:island scratch.default_name set value {creator:"Unknown Player"}
data modify storage tide:island scratch.default_name.creator set from entity @s bukkit.lastKnownName
execute in minecraft:overworld as @e[type=minecraft:marker,tag=tide.island.registry,tag=tide.island.new,limit=1] run function tide:island/name/internal/set_default with storage tide:island scratch.default_name
data remove storage tide:island scratch.default_name

execute in minecraft:overworld run scoreboard players operation @s tide.identifier.island = @e[type=minecraft:marker,tag=tide.island.registry,tag=tide.island.new,limit=1] tide.identifier.island
tag @s add tide.island.has_island
tag @s add tide.island.name.ready
execute in minecraft:overworld run tag @e[type=minecraft:marker,tag=tide.island.registry,tag=tide.island.new,limit=1] remove tide.island.new

return 1
