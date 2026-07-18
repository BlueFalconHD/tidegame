# Player islands

## Registry

Each island is represented by a `marker` tagged
`tide.island.registry` positioned at `0 -64 0`. Scoreboard 
values on the marker hold position and ID information.

`tide.island.state` on the marker:

- `0`: allocated
- `1`: queued or generating
- `2`: generated and ready
- `3`: generation failed
