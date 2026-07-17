data modify storage tide:chunkload active.status set from storage tide:chunkload active.final_status
data remove storage tide:chunkload active.final_status
data modify storage tide:chunkload last_job set from storage tide:chunkload active
data remove storage tide:chunkload active
data remove storage tide:chunkload scratch
return 1
