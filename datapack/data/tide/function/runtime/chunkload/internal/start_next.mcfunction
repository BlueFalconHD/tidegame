data modify storage tide:chunkload active set from storage tide:chunkload queue[0]
data remove storage tide:chunkload queue[0]
data modify storage tide:chunkload active.status set value "forcing"

return run function tide:runtime/chunkload/internal/force/start
