execute if data storage tide:worldgen active run function tide:world/gen/queue/poll
execute unless data storage tide:worldgen active if data storage tide:worldgen queue[0] run function tide:world/gen/queue/start_next
