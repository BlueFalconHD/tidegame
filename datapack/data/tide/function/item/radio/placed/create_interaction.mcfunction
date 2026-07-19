tag @e[tag=tide.device.radio.interaction.new] remove tide.device.radio.interaction.new

scoreboard players set #radio_interaction_created tide.device.tmp 0
execute store success score #radio_interaction_created tide.device.tmp run summon minecraft:interaction ~ ~ ~ {width:0.85f,height:1.0f,response:0b,Tags:["tide.device.radio","tide.device.radio.interaction","tide.device.radio.interaction.new"]}
execute unless score #radio_interaction_created tide.device.tmp matches 1 run return fail

scoreboard players operation @e[type=minecraft:interaction,tag=tide.device.radio.interaction.new,sort=nearest,limit=1] tide.device.id = #radio_id tide.device.id
scoreboard players operation @e[type=minecraft:interaction,tag=tide.device.radio.interaction.new,sort=nearest,limit=1] tide.device.owner = #radio_owner tide.identifier.player
tag @e[type=minecraft:interaction,tag=tide.device.radio.interaction.new,sort=nearest,limit=1] remove tide.device.radio.interaction.new
return 1
