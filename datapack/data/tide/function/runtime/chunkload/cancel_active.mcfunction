execute unless data storage tide:chunkload active run return 0

data modify storage tide:chunkload active.status set value "cancelled"
function tide:runtime/chunkload/internal/unforce with storage tide:chunkload active
data modify storage tide:chunkload last_job set from storage tide:chunkload active
data remove storage tide:chunkload active
data remove storage tide:chunkload scratch
return 1
