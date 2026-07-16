data modify storage tide:worldgen active set from storage tide:worldgen queue[0]
data remove storage tide:worldgen queue[0]
data modify storage tide:worldgen active.status set value "loading"
data modify storage tide:worldgen active.age set value 0
data modify storage tide:worldgen active.owned set value []

function tide:world/gen/queue/acquire/start
