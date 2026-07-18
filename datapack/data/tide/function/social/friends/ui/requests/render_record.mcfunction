scoreboard players set #social_target tide.social.tmp -1
scoreboard players set #social_direction tide.social.tmp 0
$execute if score #social_viewer tide.social.tmp matches $(to) run scoreboard players set #social_target tide.social.tmp $(from)
$execute if score #social_viewer tide.social.tmp matches $(to) run scoreboard players set #social_direction tide.social.tmp 1
$execute if score #social_viewer tide.social.tmp matches $(from) run scoreboard players set #social_target tide.social.tmp $(to)
$execute if score #social_viewer tide.social.tmp matches $(from) run scoreboard players set #social_direction tide.social.tmp 2
execute unless score #social_target tide.social.tmp matches 0.. run return 0

function tide:social/friends/ui/internal/prepare_viewed
execute if score #social_direction tide.social.tmp matches 1 run function tide:social/friends/ui/requests/render_incoming with storage tide:social scratch.viewed
execute if score #social_direction tide.social.tmp matches 2 run function tide:social/friends/ui/requests/render_outgoing with storage tide:social scratch.viewed
scoreboard players add #social_ui_entries tide.social.tmp 1
return 1
