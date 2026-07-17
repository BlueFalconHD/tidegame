scoreboard players set #callback_ok tide.chunkload 0
execute store success score #callback_ok tide.chunkload run function tide:runtime/chunkload/internal/invoke_ready with storage tide:chunkload active
execute if score #callback_ok tide.chunkload matches 1 run data modify storage tide:chunkload active.final_status set value "completed"
execute unless score #callback_ok tide.chunkload matches 1 run data modify storage tide:chunkload active.final_status set value "callback_failed"
execute unless score #callback_ok tide.chunkload matches 1 run data modify storage tide:chunkload last_error set value "Active request callback failed"

data modify storage tide:chunkload active.status set value "releasing"
function tide:runtime/chunkload/internal/release/start

execute if score #callback_ok tide.chunkload matches 1 run return 1
return fail
