$data modify storage tide:social ui.dialog.body append value {type:"minecraft:plain_message",contents:{text:"$(name) wants to be your friend.",color:"gray"},width:260}
$data modify storage tide:social ui.dialog.actions append value {label:{text:"Accept",color:"#E0CA8E"},width:130,action:{type:"run_command",command:"trigger tide.social.accept set $(action_target)"}}
$data modify storage tide:social ui.dialog.actions append value {label:{text:"Decline",color:"#D94286"},width:130,action:{type:"run_command",command:"trigger tide.social.decline set $(action_target)"}}
