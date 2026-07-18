tag @s remove tide.raft.travel.session
scoreboard players reset @s tide.raft.travel
scoreboard players reset @s tide.raft.travel.age
scoreboard players reset @s tide.raft.source
scoreboard players reset @s tide.raft.destination

data modify storage tide:raft ui.dialog set value {type:"minecraft:notice",title:{text:"Choose a Destination",color:"#F2F2F2"},body:[{type:"minecraft:plain_message",contents:{text:"No other raft-connected islands are available.",color:"#F2F2F2"},width:280}],can_close_with_escape:true,pause:false,after_action:"close",action:{label:{text:"Never mind",color:"#F2F2F2"},width:150}}
function tide:island/raft/destination/internal/show with storage tide:raft ui

data remove storage tide:raft scratch
return 1
