# Items

The item subsystem owns custom item definitions and their in-world behavior.

- `load.mcfunction` dispatches per-item load hooks.
- `tick.mcfunction` dispatches per-item tick hooks.
- Each item keeps its give, use, placement, pickup, and interaction handlers in its own directory.

Feature menus remain with their owning systems. The raft opens `island/raft`, and the radio opens `social/friends`.
