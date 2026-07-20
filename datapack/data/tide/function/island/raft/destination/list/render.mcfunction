$data modify storage tide:raft ui.dialog.actions append value {label:[{text:"$(status_marker) ",color:"$(status_color)"},{type:"object",object:"player",player:"$(owner_name)",hat:true},{text:" ",color:"#F2F2F2"},{text:"",color:"#F2F2F2"}],tooltip:[{text:"$(status_marker) $(status_label)\n",color:"$(status_color)"},{text:"Travel to ",color:"#F2F2F2"},{text:"",color:"#09C7E0"},{text:"\n\nPlayers",color:"#F2F2F2"}],width:280,action:{type:"run_command",command:"trigger tide.raft.travel set $(action_target)"}}
data modify storage tide:raft ui.dialog.actions[-1].label[-1].text set from storage tide:raft scratch.destination.name
data modify storage tide:raft ui.dialog.actions[-1].tooltip[2].text set from storage tide:raft scratch.destination.name
$scoreboard players set #travel_render_island tide.identifier.island $(island)
data modify storage tide:raft scratch.member_queue set from storage tide:social profiles
function tide:island/raft/destination/list/members/next
