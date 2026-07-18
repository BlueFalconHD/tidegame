$data modify storage tide:social ui.dialog.body append value {type:"minecraft:plain_message",contents:{text:"Cancel your friend request to $(name)?",color:"#F2F2F2"},width:280}
$data modify storage tide:social ui.dialog.yes.action set value {type:"run_command",command:"trigger tide.social.cancel set $(action_target)"}
data modify storage tide:social ui.dialog.no.action set value {type:"run_command",command:"trigger tide.social.menu set 2"}
