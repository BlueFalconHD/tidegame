$data modify storage tide:social ui.dialog.body append value {type:"minecraft:plain_message",contents:{text:"Remove $(name) from your friends?",color:"#F2F2F2"},width:260}
$data modify storage tide:social ui.dialog.yes.action set value {type:"run_command",command:"trigger tide.social.remove set $(action_target)"}
$data modify storage tide:social ui.dialog.no.action set value {type:"run_command",command:"trigger tide.social.profile set $(action_target)"}
