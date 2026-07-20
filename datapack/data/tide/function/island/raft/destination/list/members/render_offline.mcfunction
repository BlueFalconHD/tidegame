data modify storage tide:raft ui.dialog.actions[-1].tooltip append value {text:"\n○ ",color:"gray"}
$data modify storage tide:raft ui.dialog.actions[-1].tooltip append value {type:"object",object:"player",player:"$(name)",hat:true}
$data modify storage tide:raft ui.dialog.actions[-1].tooltip append value {text:" $(name)",color:"#F2F2F2"}
return 1
