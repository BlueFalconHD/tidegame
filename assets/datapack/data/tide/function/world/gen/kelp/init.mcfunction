##CONFIGURE
execute store result score @s tide.worldgen.kelp.height run random value 3..14

# say t

tag @s add worldgen_kelp

execute at @s positioned over ocean_floor run tp @s ~ ~-1 ~
# execute at @s run tp @s ~ ~-1 ~
