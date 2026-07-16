function tide:world/gen/queue/check/start
execute if score #all_ready tide.wgen matches 1 run return run function tide:world/gen/queue/ready
return 0
