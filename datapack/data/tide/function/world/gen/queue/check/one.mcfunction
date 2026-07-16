# In 1.21.10 this condition requires ENTITY_TICKING and ServerWorld.isChunkLoaded,
# exactly matching the state needed for selectors and block/structure commands.
$execute in $(dimension) unless loaded $(x) 0 $(z) run scoreboard players set #all_ready tide.wgen 0
