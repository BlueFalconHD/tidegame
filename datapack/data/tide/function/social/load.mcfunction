scoreboard objectives add tide.social.request trigger
scoreboard objectives add tide.social.accept trigger
scoreboard objectives add tide.social.decline trigger
scoreboard objectives add tide.social.remove trigger
scoreboard objectives add tide.social.open trigger
scoreboard objectives add tide.social.tmp dummy

execute unless data storage tide:social friends run data modify storage tide:social friends set value []
execute unless data storage tide:social requests run data modify storage tide:social requests set value []
