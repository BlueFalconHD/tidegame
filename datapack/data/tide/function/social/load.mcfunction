scoreboard objectives add tide.social.request trigger
scoreboard objectives add tide.social.accept trigger
scoreboard objectives add tide.social.decline trigger
scoreboard objectives add tide.social.remove trigger
scoreboard objectives add tide.social.open trigger
scoreboard objectives add tide.social.menu trigger
scoreboard objectives add tide.social.profile trigger
scoreboard objectives add tide.social.respond trigger
scoreboard objectives add tide.social.remove_confirm trigger
scoreboard objectives add tide.social.cancel_prompt trigger
scoreboard objectives add tide.social.cancel trigger
scoreboard objectives add tide.social.leaves minecraft.custom:minecraft.leave_game
scoreboard objectives add tide.social.seen_leaves dummy
scoreboard objectives add tide.social.tmp dummy

execute unless data storage tide:social friends run data modify storage tide:social friends set value []
execute unless data storage tide:social requests run data modify storage tide:social requests set value []
execute unless data storage tide:social profiles run data modify storage tide:social profiles set value []
