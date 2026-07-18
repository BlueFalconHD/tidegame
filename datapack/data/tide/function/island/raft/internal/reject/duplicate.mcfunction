execute if score #return_item tide.raft.tmp matches 1 at @a[tag=tide.raft.placer,limit=1] run loot spawn ~ ~ ~ loot tide:island/raft
title @a[tag=tide.raft.placer,limit=1] actionbar {"text":"This island already has a deployed raft.","color":"red"}
kill @s

return 0
