execute if score @s tide.loading.state matches 1..2 run function tide:runtime/loading/stop
tag @s remove tide.raft.ocean.settling
scoreboard players reset @s tide.raft.travel.age
title @s actionbar [{"text":"Arrived at the ", color: "#F2F2F2"},{text:"Open Ocean","color":"#09C7E0"}]
return 1
