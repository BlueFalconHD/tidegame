scoreboard players operation #social_pair_a tide.social.tmp = #social_source tide.social.tmp
scoreboard players operation #social_pair_b tide.social.tmp = #social_target tide.social.tmp
execute if score #social_pair_a tide.social.tmp > #social_pair_b tide.social.tmp run function tide:social/friends/internal/swap_pair

data modify storage tide:social scratch.pair set value {}
execute store result storage tide:social scratch.pair.a int 1 run scoreboard players get #social_pair_a tide.social.tmp
execute store result storage tide:social scratch.pair.b int 1 run scoreboard players get #social_pair_b tide.social.tmp
