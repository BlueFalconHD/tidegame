data modify storage tide:worldgen active.status set value "failed"
execute if data storage tide:worldgen active.on_failure run function tide:world/gen/queue/invoke_failure with storage tide:worldgen active
function tide:world/gen/queue/release/start
data modify storage tide:worldgen last_job set from storage tide:worldgen active
data remove storage tide:worldgen last_job.owned
data remove storage tide:worldgen active
return fail
