# Friends

Friendships and requests persist in `storage tide:social`:

- `friends`: canonical pairs shaped like `{a:1,b:4}`, where `a < b`
- `requests`: directional records shaped like `{from:1,to:4}`

## API

```mcfunction
function tide:social/friends/request {target:4}
function tide:social/friends/accept {target:1}
function tide:social/friends/decline {target:1}
function tide:social/friends/remove {target:4}
function tide:social/friends/list
function tide:social/friends/open
```

`function tide:social/friends/query {player_a:1,player_b:4}` returns `1` when
the two IDs are friends and `0` otherwise.

The trigger objectives mirror those operations Triggers encode their target as 
`player ID + 1`. Until another UI opens it, players can use `/trigger tide.social.open` 
to display that menu.
