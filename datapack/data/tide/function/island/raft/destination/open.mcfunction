execute if entity @s[tag=tide.raft.travel.departing] run title @s actionbar {"text":"A voyage is already underway.","color":"#F79317"}
execute if entity @s[tag=tide.raft.travel.departing] run scoreboard players reset @s tide.raft.source
execute if entity @s[tag=tide.raft.travel.departing] run return fail
execute if entity @s[tag=tide.raft.travel.pending] run title @s actionbar {"text":"A voyage is already underway.","color":"#F79317"}
execute if entity @s[tag=tide.raft.travel.pending] run scoreboard players reset @s tide.raft.source
execute if entity @s[tag=tide.raft.travel.pending] run return fail

execute unless score @s tide.identifier.player matches 0.. run function tide:runtime/identifier/assign/player
execute as @a run function tide:social/profile/sync

tag @s remove tide.raft.travel.session
scoreboard players reset @s tide.raft.travel
scoreboard players reset @s tide.raft.travel.age

scoreboard players operation #travel_viewer tide.identifier.player = @s tide.identifier.player
scoreboard players set #travel_entries tide.raft.tmp 0

data modify storage tide:raft ui.dialog set value {type:"minecraft:multi_action",title:{text:"Choose a Destination",color:"#F2F2F2"},body:[{type:"minecraft:plain_message",contents:{text:"Choose where to set sail.",color:"#F2F2F2"},width:280}],can_close_with_escape:true,pause:false,after_action:"close",actions:[],columns:1,exit_action:{label:{text:"Never mind",color:"#F2F2F2"},width:150,action:{type:"run_command",command:"trigger tide.raft.travel set -1"}}}
data modify storage tide:raft scratch.seen set value []
data modify storage tide:raft scratch.destinations set value {online:[],offline:[]}
function tide:island/raft/destination/list/add_open_ocean
function tide:island/raft/destination/list/add_home
data modify storage tide:raft scratch.queue set from storage tide:social friends
function tide:island/raft/destination/list/next
data modify storage tide:raft scratch.render_queue set from storage tide:raft scratch.destinations.online
function tide:island/raft/destination/list/render_next
data modify storage tide:raft scratch.render_queue set from storage tide:raft scratch.destinations.offline
function tide:island/raft/destination/list/render_next

execute unless score #travel_entries tide.raft.tmp matches 1.. run return run function tide:island/raft/destination/empty

tag @s add tide.raft.travel.session
scoreboard players set @s tide.raft.travel.age 0
scoreboard players enable @s tide.raft.travel
function tide:island/raft/destination/internal/show with storage tide:raft ui

data remove storage tide:raft scratch
return 1
