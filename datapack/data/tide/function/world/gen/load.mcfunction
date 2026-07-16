scoreboard objectives add tide.worldgen.kelp.height dummy worldgen.kelp.height

# Persistent FIFO chunk-loading queue. Existing storage is deliberately kept
# across /reload and server restarts so an in-flight job can resume polling.
scoreboard objectives add tide.wgen dummy
scoreboard players set #sixteen tide.wgen 16
execute unless score #next_id tide.wgen matches 1.. run scoreboard players set #next_id tide.wgen 1

execute unless data storage tide:worldgen queue run data modify storage tide:worldgen queue set value []
execute unless data storage tide:worldgen config.max_span run data modify storage tide:worldgen config.max_span set value 5
execute unless data storage tide:worldgen config.max_chunks run data modify storage tide:worldgen config.max_chunks set value 25
execute unless data storage tide:worldgen config.max_queue run data modify storage tide:worldgen config.max_queue set value 128
execute unless data storage tide:worldgen config.timeout_ticks run data modify storage tide:worldgen config.timeout_ticks set value 1200
