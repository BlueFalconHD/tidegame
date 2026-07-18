execute if data storage tide:island free_ids[0] run function tide:island/internal/reuse_id
execute unless score @s tide.identifier.island matches 0.. run function tide:runtime/identifier/assign/island
function tide:island/internal/calculate_slot
scoreboard players set @s tide.island.state 0

return 1
