# Public API: copy a job compound to tide:worldgen request, then call this.
# Returns success with the assigned job id, or failure with last_error populated.
data remove storage tide:worldgen last_error
execute unless data storage tide:worldgen request run return run function tide:world/gen/queue/reject/no_request

data modify storage tide:worldgen work set from storage tide:worldgen request
data remove storage tide:worldgen request

execute unless data storage tide:worldgen work.dimension run return run function tide:world/gen/queue/reject/missing_fields
execute unless data storage tide:worldgen work.callback run return run function tide:world/gen/queue/reject/missing_fields
execute unless data storage tide:worldgen work.x run return run function tide:world/gen/queue/reject/missing_fields
execute unless data storage tide:worldgen work.y run return run function tide:world/gen/queue/reject/missing_fields
execute unless data storage tide:worldgen work.z run return run function tide:world/gen/queue/reject/missing_fields
execute unless data storage tide:worldgen work.min_x run return run function tide:world/gen/queue/reject/missing_fields
execute unless data storage tide:worldgen work.min_z run return run function tide:world/gen/queue/reject/missing_fields
execute unless data storage tide:worldgen work.max_x run return run function tide:world/gen/queue/reject/missing_fields
execute unless data storage tide:worldgen work.max_z run return run function tide:world/gen/queue/reject/missing_fields

return run function tide:world/gen/queue/normalize
