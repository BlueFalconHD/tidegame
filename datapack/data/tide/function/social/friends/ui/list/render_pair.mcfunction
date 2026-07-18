scoreboard players set #social_target tide.social.tmp -1
$execute if score #social_viewer tide.social.tmp matches $(a) run scoreboard players set #social_target tide.social.tmp $(b)
$execute if score #social_viewer tide.social.tmp matches $(b) run scoreboard players set #social_target tide.social.tmp $(a)
execute unless score #social_target tide.social.tmp matches 0.. run return 0

function tide:social/friends/ui/internal/prepare_viewed
execute if data storage tide:social scratch.viewed{online:1b} run function tide:social/friends/ui/list/render_online with storage tide:social scratch.viewed
execute unless data storage tide:social scratch.viewed{online:1b} run function tide:social/friends/ui/list/render_offline with storage tide:social scratch.viewed
scoreboard players add #social_ui_entries tide.social.tmp 1
return 1
