data modify storage tide:worldgen active set from storage tide:worldgen queue[0]
data remove storage tide:worldgen queue[0]

function tide:chunkload/queue/force with storage tide:worldgen active
