execute if data storage tide:chunkload active run function tide:runtime/chunkload/internal/poll
execute unless data storage tide:chunkload active if data storage tide:chunkload queue[0] run function tide:runtime/chunkload/internal/start_next
