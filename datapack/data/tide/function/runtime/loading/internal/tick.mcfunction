execute if score @s tide.loading.state matches 1 run return run function tide:runtime/loading/internal/fade_in
execute if score @s tide.loading.state matches 2 run return run function tide:runtime/loading/internal/active
execute if score @s tide.loading.state matches 3 run return run function tide:runtime/loading/internal/fade_out

return 0

