function tide:chunkload/queue/check/start
execute if score #all_ready tide.chunkload matches 1 run return run function tide:chunkload/queue/ready
return 0
