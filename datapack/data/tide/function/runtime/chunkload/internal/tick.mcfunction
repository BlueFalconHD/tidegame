execute if data storage tide:chunkload active{status:"forcing"} run return run function tide:runtime/chunkload/internal/force/step
execute if data storage tide:chunkload active{status:"loading"} run return run function tide:runtime/chunkload/internal/poll
execute if data storage tide:chunkload active{status:"releasing"} run return run function tide:runtime/chunkload/internal/release/step
execute if data storage tide:chunkload active run return 0
execute if data storage tide:chunkload queue[0] run return run function tide:runtime/chunkload/internal/start_next
return 0
