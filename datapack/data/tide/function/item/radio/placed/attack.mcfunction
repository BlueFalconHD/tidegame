scoreboard players operation #radio_id tide.device.id = @s tide.device.id
scoreboard players operation #radio_owner tide.identifier.player = @s tide.device.owner
scoreboard players set #radio_pickup_allowed tide.device.tmp 0
scoreboard players set #radio_picked_up tide.device.tmp 0

execute on attacker unless score @s tide.identifier.player matches 0.. run function tide:runtime/identifier/assign/player
execute on attacker if score @s tide.identifier.player = #radio_owner tide.identifier.player run scoreboard players set #radio_pickup_allowed tide.device.tmp 1
execute unless score #radio_pickup_allowed tide.device.tmp matches 1 on attacker run title @s actionbar {"text":"Only the player who placed this radio can pick it up.","color":"#D94286"}

tag @a remove tide.device.radio.picker
execute if score #radio_pickup_allowed tide.device.tmp matches 1 on attacker run tag @s add tide.device.radio.picker
execute if score #radio_pickup_allowed tide.device.tmp matches 1 at @s as @e[type=minecraft:item_display,tag=tide.device.radio.display,distance=..2] if score @s tide.device.id = #radio_id tide.device.id at @s run function tide:item/radio/placed/pickup
tag @a remove tide.device.radio.picker

data remove entity @s attack
return run scoreboard players get #radio_picked_up tide.device.tmp
