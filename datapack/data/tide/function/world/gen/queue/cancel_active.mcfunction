execute unless data storage tide:worldgen active run return 0
data modify storage tide:worldgen active.error set value {code:"cancelled",message:"The active job was cancelled."}
return run function tide:world/gen/queue/fail
