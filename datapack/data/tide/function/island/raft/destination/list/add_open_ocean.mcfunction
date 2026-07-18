data modify storage tide:raft ui.dialog.actions append value {label:{text:"Open Ocean",color:"#F2F2F2"},tooltip:{text:"Set sail for the open ocean",color:"#09C7E0"},width:280,action:{type:"run_command",command:"trigger tide.raft.travel set 1"}}
scoreboard players add #travel_entries tide.raft.tmp 1
return 1
