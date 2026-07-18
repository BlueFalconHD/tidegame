# Each 8 x 32 x 128 fill is exactly the command's 32,768-block limit.
fill ~ ~-64 ~ ~7 ~-33 ~127 minecraft:air
fill ~ ~-32 ~ ~7 ~-1 ~127 minecraft:air
fill ~ ~ ~ ~7 ~31 ~127 minecraft:air
fill ~ ~32 ~ ~7 ~63 ~127 minecraft:air
fill ~ ~64 ~ ~7 ~95 ~127 minecraft:air
fill ~ ~96 ~ ~7 ~127 ~127 minecraft:air
fill ~ ~128 ~ ~7 ~159 ~127 minecraft:air
fill ~ ~160 ~ ~7 ~191 ~127 minecraft:air
fill ~ ~192 ~ ~7 ~223 ~127 minecraft:air
fill ~ ~224 ~ ~7 ~255 ~127 minecraft:air
fill ~ ~256 ~ ~7 ~287 ~127 minecraft:air
fill ~ ~288 ~ ~7 ~319 ~127 minecraft:air

scoreboard players add #destroy_strip tide.island.tmp 1
execute if score #destroy_strip tide.island.tmp matches ..15 positioned ~8 ~ ~ run function tide:island/destroy/internal/clear
return 1
