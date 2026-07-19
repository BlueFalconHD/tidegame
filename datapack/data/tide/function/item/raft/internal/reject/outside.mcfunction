execute if score #return_item tide.raft.tmp matches 1 at @a[tag=tide.raft.placer,limit=1] run loot spawn ~ ~ ~ loot tide:item/raft
title @a[tag=tide.raft.placer,limit=1] actionbar {"text":"The raft must be placed on a generated player island.","color":"#D94286"}
kill @s

return 0
