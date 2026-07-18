World services track every player's current gameplay area on `tide.location`:

- `0`: outside Tide
- `1`: open ocean
- `2`: a generated player island

When the location is an island, `tide.location.island` contains that island's
identifier. Location is derived from the player's dimension and position every tick,
so teleports and visits to other players' islands are tracked independently from island
membership.

The playable ocean occupies `-376..376` on X/Z. Crossing 32 blocks beyond that
artificial boundary starts a covered return voyage to the player's own deployed raft.
