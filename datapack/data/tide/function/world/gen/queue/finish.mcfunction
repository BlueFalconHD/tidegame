data modify storage tide:worldgen active.status set value "complete"
function tide:world/gen/queue/release/start
data modify storage tide:worldgen last_job set from storage tide:worldgen active
data remove storage tide:worldgen last_job.owned
data remove storage tide:worldgen active
return 1
