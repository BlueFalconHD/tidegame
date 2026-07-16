data modify storage tide:worldgen last_error set value {code:"too_large",message:"The normalized chunk rectangle exceeds config.max_span, config.max_chunks, or the hard 256-chunk safety limit."}
execute store result storage tide:worldgen last_error.width int 1 run scoreboard players get #chunk_width tide.wgen
execute store result storage tide:worldgen last_error.depth int 1 run scoreboard players get #chunk_depth tide.wgen
execute store result storage tide:worldgen last_error.chunks int 1 run scoreboard players get #chunk_count tide.wgen
data modify storage tide:worldgen last_error.job set from storage tide:worldgen work
data remove storage tide:worldgen work
return fail
