# run this function high in the air above water

execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}
execute at @s run summon marker ~ ~ ~ {Tags:["worldgen_temp"]}

# we have to make a "platform" for them to spawn on since spreadplayer
# doesn't work for non-air (ie water)
# we remove once spread occurs
execute at @s run fill ~-20 ~ ~-20 ~20 ~ ~20 stone

##CONFIGURE
execute at @s run spreadplayers ~ ~ 0 30 false @e[type=marker,tag=worldgen_temp]

execute at @s run fill ~-20 ~ ~-20 ~20 ~ ~20 air
execute as @e[type=marker,tag=worldgen_temp] at @s run function tide:world/gen/kelp/step
