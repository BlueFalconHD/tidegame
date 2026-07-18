data modify storage tide:social ui.dialog.body append value {type:"minecraft:plain_message",contents:{text:"Current location: ",color:"#F2F2F2",extra:[{text:"",color:"#09C7E0",extra:[]}]},width:260}
data modify storage tide:social ui.dialog.body[-1].contents.extra[0].extra append from storage tide:social scratch.viewed.location
return 1
