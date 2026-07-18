# Keep the placeholder inline so opening the raft does not depend on a registered
# dialog resource. This can later be replaced by a per-player macro compound.
dialog show @s {type:"minecraft:notice",title:{text:"Choose a Destination",color:"aqua"},body:[{type:"minecraft:plain_message",contents:{text:"No destinations are available yet.",color:"gray"}}],can_close_with_escape:true,pause:false,action:{label:{text:"Never mind"}}}
