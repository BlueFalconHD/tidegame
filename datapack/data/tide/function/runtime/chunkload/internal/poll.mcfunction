scoreboard players operation #check_budget tide.chunkload = #forceload_limit tide.chunkload
scoreboard players set #all_ready tide.chunkload 0
function tide:runtime/chunkload/internal/check/step
execute if score #all_ready tide.chunkload matches 1 run return run function tide:runtime/chunkload/internal/ready
return 0
