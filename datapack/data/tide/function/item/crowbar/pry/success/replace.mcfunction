execute if entity @s[y=-64,dy=62] run setblock ~ ~ ~ minecraft:water strict
execute unless entity @s[y=-64,dy=62] run setblock ~ ~ ~ minecraft:air strict
kill @s
