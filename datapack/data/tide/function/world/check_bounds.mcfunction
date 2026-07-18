
# Return players after they travel 32 blocks beyond the artificial ocean border.
execute as @a[tag=!tide.ocean.returning,tag=!tide.ocean.return.pending,scores={tide.area_transition=..0}] at @s if dimension tide:ocean unless entity @s[x=-408,dx=816,z=-408,dz=816] run function tide:world/ocean/leave
