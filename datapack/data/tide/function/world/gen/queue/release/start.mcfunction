execute unless data storage tide:worldgen active.owned[0] run return 0

data modify storage tide:worldgen scratch set from storage tide:worldgen active.owned[0]
function tide:world/gen/queue/release/one with storage tide:worldgen scratch
data remove storage tide:worldgen active.owned[0]
return run function tide:world/gen/queue/release/start
