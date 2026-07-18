# Player islands

## Registry

Each island is represented by a `marker` tagged
`tide.island.registry` positioned at `0 -64 0`. Scoreboard 
values on the marker hold position and ID information.

`tide.island.owner` stores the player ID of the island creator. The canonical
display name is stored as a string at `data.name`, so every member of an island
and every social UI resolves the same name from the registry record. New names
default to `<creator>'s Island` using `bukkit.lastKnownName`.

`tide.island.state` on the marker:

- `0`: allocated
- `1`: queued or generating
- `2`: generated and ready
- `3`: generation failed

TODO: fix jank naming
