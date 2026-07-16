scoreboard players set #min_x tide.chunkload 0
scoreboard players set #min_z tide.chunkload 0
scoreboard players set #max_x tide.chunkload 0
scoreboard players set #max_z tide.chunkload 0
execute store result score #min_x tide.chunkload run data get storage tide:chunkload request.min_x
execute store result score #min_z tide.chunkload run data get storage tide:chunkload request.min_z
execute store result score #max_x tide.chunkload run data get storage tide:chunkload request.max_x
execute store result score #max_z tide.chunkload run data get storage tide:chunkload request.max_z

execute if score #min_x tide.chunkload > #max_x tide.chunkload run data modify storage tide:chunkload last_error set value "min_x exceeds max_x"
execute if score #min_x tide.chunkload > #max_x tide.chunkload run data remove storage tide:chunkload request
execute if score #min_x tide.chunkload > #max_x tide.chunkload run return fail
execute if score #min_z tide.chunkload > #max_z tide.chunkload run data modify storage tide:chunkload last_error set value "min_z exceeds max_z"
execute if score #min_z tide.chunkload > #max_z tide.chunkload run data remove storage tide:chunkload request
execute if score #min_z tide.chunkload > #max_z tide.chunkload run return fail

scoreboard players operation #min_chunk_x tide.chunkload = #min_x tide.chunkload
scoreboard players operation #min_chunk_z tide.chunkload = #min_z tide.chunkload
scoreboard players operation #max_chunk_x tide.chunkload = #max_x tide.chunkload
scoreboard players operation #max_chunk_z tide.chunkload = #max_z tide.chunkload
scoreboard players operation #min_remainder_x tide.chunkload = #min_x tide.chunkload
scoreboard players operation #min_remainder_z tide.chunkload = #min_z tide.chunkload
scoreboard players operation #max_remainder_x tide.chunkload = #max_x tide.chunkload
scoreboard players operation #max_remainder_z tide.chunkload = #max_z tide.chunkload
scoreboard players operation #min_chunk_x tide.chunkload /= #sixteen tide.chunkload
scoreboard players operation #min_chunk_z tide.chunkload /= #sixteen tide.chunkload
scoreboard players operation #max_chunk_x tide.chunkload /= #sixteen tide.chunkload
scoreboard players operation #max_chunk_z tide.chunkload /= #sixteen tide.chunkload
scoreboard players operation #min_remainder_x tide.chunkload %= #sixteen tide.chunkload
scoreboard players operation #min_remainder_z tide.chunkload %= #sixteen tide.chunkload
scoreboard players operation #max_remainder_x tide.chunkload %= #sixteen tide.chunkload
scoreboard players operation #max_remainder_z tide.chunkload %= #sixteen tide.chunkload
execute if score #min_remainder_x tide.chunkload matches ..-1 run scoreboard players remove #min_chunk_x tide.chunkload 1
execute if score #min_remainder_z tide.chunkload matches ..-1 run scoreboard players remove #min_chunk_z tide.chunkload 1
execute if score #max_remainder_x tide.chunkload matches ..-1 run scoreboard players remove #max_chunk_x tide.chunkload 1
execute if score #max_remainder_z tide.chunkload matches ..-1 run scoreboard players remove #max_chunk_z tide.chunkload 1

scoreboard players operation #span_x tide.chunkload = #max_chunk_x tide.chunkload
scoreboard players operation #span_x tide.chunkload -= #min_chunk_x tide.chunkload
scoreboard players add #span_x tide.chunkload 1
scoreboard players operation #span_z tide.chunkload = #max_chunk_z tide.chunkload
scoreboard players operation #span_z tide.chunkload -= #min_chunk_z tide.chunkload
scoreboard players add #span_z tide.chunkload 1
execute if score #span_x tide.chunkload matches 257.. run data modify storage tide:chunkload last_error set value "Request exceeds the 256 chunk limit"
execute if score #span_x tide.chunkload matches 257.. run data remove storage tide:chunkload request
execute if score #span_x tide.chunkload matches 257.. run return fail
execute if score #span_z tide.chunkload matches 257.. run data modify storage tide:chunkload last_error set value "Request exceeds the 256 chunk limit"
execute if score #span_z tide.chunkload matches 257.. run data remove storage tide:chunkload request
execute if score #span_z tide.chunkload matches 257.. run return fail
scoreboard players operation #chunk_count tide.chunkload = #span_x tide.chunkload
scoreboard players operation #chunk_count tide.chunkload *= #span_z tide.chunkload
execute if score #chunk_count tide.chunkload matches 257.. run data modify storage tide:chunkload last_error set value "Request exceeds the 256 chunk limit"
execute if score #chunk_count tide.chunkload matches 257.. run data remove storage tide:chunkload request
execute if score #chunk_count tide.chunkload matches 257.. run return fail

scoreboard players set #queue_size tide.chunkload 0
execute store result score #queue_size tide.chunkload run data get storage tide:chunkload queue
execute if score #queue_size tide.chunkload matches 128.. run data modify storage tide:chunkload last_error set value "Queue already contains 128 requests"
execute if score #queue_size tide.chunkload matches 128.. run data remove storage tide:chunkload request
execute if score #queue_size tide.chunkload matches 128.. run return fail

execute store result storage tide:chunkload request.min_chunk_x int 1 run scoreboard players get #min_chunk_x tide.chunkload
execute store result storage tide:chunkload request.min_chunk_z int 1 run scoreboard players get #min_chunk_z tide.chunkload
execute store result storage tide:chunkload request.max_chunk_x int 1 run scoreboard players get #max_chunk_x tide.chunkload
execute store result storage tide:chunkload request.max_chunk_z int 1 run scoreboard players get #max_chunk_z tide.chunkload
data modify storage tide:chunkload request.status set value "queued"
data modify storage tide:chunkload last_enqueued set from storage tide:chunkload request
data modify storage tide:chunkload queue append from storage tide:chunkload request
data remove storage tide:chunkload request
return 1
