execute if data storage tide:worldgen active run function tide:chunkload/queue/poll
execute unless data storage tide:worldgen active if data storage tide:worldgen queue[0] run function tide:chunkload/queue/start_next
