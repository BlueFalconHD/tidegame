scoreboard objectives add tide.worldgen.kelp.height dummy worldgen.kelp.height

scoreboard objectives add tide.wgen dummy
scoreboard players set #sixteen tide.wgen 16

execute unless data storage tide:worldgen queue run data modify storage tide:worldgen queue set value []
data remove storage tide:worldgen config
data remove storage tide:worldgen last_enqueued
data remove storage tide:worldgen last_job
data remove storage tide:worldgen last_error
data remove storage tide:worldgen work
