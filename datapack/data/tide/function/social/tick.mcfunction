execute as @a unless score @s tide.identifier.player matches 0.. run function tide:runtime/identifier/assign/player

execute as @a[scores={tide.social.request=1..}] run function tide:social/friends/internal/request
execute as @a[scores={tide.social.accept=1..}] run function tide:social/friends/internal/accept
execute as @a[scores={tide.social.decline=1..}] run function tide:social/friends/internal/decline
execute as @a[scores={tide.social.remove=1..}] run function tide:social/friends/internal/remove
execute as @a[scores={tide.social.open=1..}] run function tide:social/friends/open

scoreboard players enable @a tide.social.request
scoreboard players enable @a tide.social.accept
scoreboard players enable @a tide.social.decline
scoreboard players enable @a tide.social.remove
scoreboard players enable @a tide.social.open
