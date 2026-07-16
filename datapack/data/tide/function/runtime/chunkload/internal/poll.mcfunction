function tide:runtime/chunkload/internal/check/start
execute if score #all_ready tide.chunkload matches 1 run return run function tide:runtime/chunkload/internal/ready
return 0
