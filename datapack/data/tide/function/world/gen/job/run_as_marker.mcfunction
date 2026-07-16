# Adapter callback for marker jobs. Supply marker_callback in the queued job.
$return run execute as @e[type=minecraft:marker,nbt={UUID:$(marker_uuid)},limit=1] at @s run function $(marker_callback) with storage tide:worldgen active
