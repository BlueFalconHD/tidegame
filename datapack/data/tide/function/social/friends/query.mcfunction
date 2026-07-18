$scoreboard players set #social_source tide.social.tmp $(player_a)
$scoreboard players set #social_target tide.social.tmp $(player_b)
execute unless score #social_source tide.social.tmp matches 0.. run return 0
execute unless score #social_target tide.social.tmp matches 0.. run return 0
function tide:social/friends/internal/prepare_pair
return run function tide:social/friends/internal/friend_exists with storage tide:social scratch.pair
