execute unless data storage tide:chunkload active run return 0
execute if data storage tide:chunkload active{status:"releasing"} run return 0

data modify storage tide:chunkload active.final_status set value "cancelled"
data modify storage tide:chunkload active.status set value "releasing"
function tide:runtime/chunkload/internal/release/start
return 1
