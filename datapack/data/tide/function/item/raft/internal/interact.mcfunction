scoreboard players operation #travel_source tide.identifier.island = @s tide.identifier.island
execute on target run scoreboard players operation @s tide.raft.source = #travel_source tide.identifier.island
execute on target run function tide:island/raft/open
data remove entity @s interaction
