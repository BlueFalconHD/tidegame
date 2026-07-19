scoreboard objectives add tide.device.id dummy
scoreboard objectives add tide.device.owner dummy
scoreboard objectives add tide.device.tmp dummy
scoreboard objectives add tide.device.cooldown dummy

scoreboard players add .next tide.device.id 0
scoreboard players reset @a tide.device.cooldown
