execute unless data storage tide:raft scratch.member.island_id run return 0

scoreboard players set #travel_member_island tide.identifier.island -1
execute store result score #travel_member_island tide.identifier.island run data get storage tide:raft scratch.member.island_id
execute unless score #travel_member_island tide.identifier.island = #travel_render_island tide.identifier.island run return 0

scoreboard players set #travel_member tide.identifier.player -1
execute store result score #travel_member tide.identifier.player run data get storage tide:raft scratch.member.id
scoreboard players set #travel_member_online tide.raft.tmp 0
execute as @a if score @s tide.identifier.player = #travel_member tide.identifier.player run scoreboard players set #travel_member_online tide.raft.tmp 1
execute if score #travel_member_online tide.raft.tmp matches 1 run return run function tide:island/raft/destination/list/members/render_online with storage tide:raft scratch.member
return run function tide:island/raft/destination/list/members/render_offline with storage tide:raft scratch.member
