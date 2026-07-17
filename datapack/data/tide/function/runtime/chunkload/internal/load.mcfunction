scoreboard objectives add tide.chunkload dummy
scoreboard players set #sixteen tide.chunkload 16
scoreboard players set #forceload_limit tide.chunkload 256

execute unless data storage tide:chunkload queue run data modify storage tide:chunkload queue set value []
execute if data storage tide:chunkload active{status:"loading"} run function tide:runtime/chunkload/internal/check/start
