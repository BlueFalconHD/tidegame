# Public asynchronous entrypoint. Success means the destruction was queued.
data modify storage tide:chunkload request set value {dimension:"tide:ocean",callback:"tide:worldgen/map/structure/destroy/ready",x:0,y:0,z:0,min_x:0,min_z:0,max_x:0,max_z:0,structure_id:0}
return run function tide:worldgen/map/structure/internal/enqueue
