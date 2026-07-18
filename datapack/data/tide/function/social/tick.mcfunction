execute as @a unless score @s tide.identifier.player matches 0.. run function tide:runtime/identifier/assign/player
scoreboard players add @a tide.social.leaves 0
execute as @a unless score @s tide.social.seen_leaves = @s tide.social.leaves run function tide:social/profile/sync
execute as @a unless score @s tide.social.seen_leaves = @s tide.social.leaves run scoreboard players operation @s tide.social.seen_leaves = @s tide.social.leaves

execute as @a[scores={tide.social.request=1..}] run function tide:social/friends/internal/request
execute as @a[scores={tide.social.accept=1..}] run function tide:social/friends/internal/accept
execute as @a[scores={tide.social.decline=1..}] run function tide:social/friends/internal/decline
execute as @a[scores={tide.social.remove=1..}] run function tide:social/friends/internal/remove
execute as @a[scores={tide.social.open=1..}] run function tide:social/friends/open
execute as @a[scores={tide.social.menu=1..}] run function tide:social/friends/ui/internal/menu
execute as @a[scores={tide.social.profile=1..}] run function tide:social/friends/ui/profile/open
execute as @a[scores={tide.social.respond=1..}] run function tide:social/friends/ui/requests/respond
execute as @a[scores={tide.social.remove_confirm=1..}] run function tide:social/friends/ui/profile/remove_confirm

scoreboard players enable @a tide.social.request
scoreboard players enable @a tide.social.accept
scoreboard players enable @a tide.social.decline
scoreboard players enable @a tide.social.remove
scoreboard players enable @a tide.social.open
scoreboard players enable @a tide.social.menu
scoreboard players enable @a tide.social.profile
scoreboard players enable @a tide.social.respond
scoreboard players enable @a tide.social.remove_confirm
