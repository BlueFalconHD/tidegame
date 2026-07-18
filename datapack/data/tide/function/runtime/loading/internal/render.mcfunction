function tide:runtime/loading/internal/select_flavor

execute if score @s tide.loading.frame matches 0 run return run function tide:runtime/loading/internal/render/frame_0 with storage tide:loading
execute if score @s tide.loading.frame matches 1 run return run function tide:runtime/loading/internal/render/frame_1 with storage tide:loading
execute if score @s tide.loading.frame matches 2 run return run function tide:runtime/loading/internal/render/frame_2 with storage tide:loading
execute if score @s tide.loading.frame matches 3 run return run function tide:runtime/loading/internal/render/frame_3 with storage tide:loading
execute if score @s tide.loading.frame matches 4 run return run function tide:runtime/loading/internal/render/frame_4 with storage tide:loading
execute if score @s tide.loading.frame matches 5 run return run function tide:runtime/loading/internal/render/frame_5 with storage tide:loading
execute if score @s tide.loading.frame matches 6 run return run function tide:runtime/loading/internal/render/frame_6 with storage tide:loading
execute if score @s tide.loading.frame matches 7 run return run function tide:runtime/loading/internal/render/frame_7 with storage tide:loading

return 0

