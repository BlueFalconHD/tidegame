execute as @a unless score @s tide.area_transition matches -2147483648..2147483647 run scoreboard players set @s tide.area_transition 0
scoreboard players set @a[tag=!tide.ocean.returning,tag=!tide.ocean.return.pending] tide.area_transition 0
scoreboard players remove @a[tag=tide.ocean.returning,scores={tide.area_transition=1..}] tide.area_transition 1
execute as @a[tag=tide.ocean.returning,scores={tide.area_transition=..0,tide.loading.state=2}] at @s run function tide:world/ocean/return_home/depart
scoreboard players remove @a[tag=tide.ocean.return.pending,scores={tide.area_transition=1..}] tide.area_transition 1
execute as @a[tag=tide.ocean.return.pending,scores={tide.area_transition=..0}] at @s run function tide:world/ocean/return_home/timeout
