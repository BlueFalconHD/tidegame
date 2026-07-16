data modify storage tide:worldgen active.status set value "running"
scoreboard players set #callback_ok tide.wgen 0
execute store success score #callback_ok tide.wgen run function tide:world/gen/queue/invoke_ready with storage tide:worldgen active
execute if score #callback_ok tide.wgen matches 1 run return run function tide:world/gen/queue/finish

data modify storage tide:worldgen active.error set value {code:"callback_failed",message:"The callback was missing, failed macro expansion, or returned failure."}
return run function tide:world/gen/queue/fail
