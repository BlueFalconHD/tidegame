execute unless data storage tide:worldgen active run return 0
function tide:chunkload/queue/unforce with storage tide:worldgen active
data remove storage tide:worldgen active
data remove storage tide:worldgen scratch
return 1
