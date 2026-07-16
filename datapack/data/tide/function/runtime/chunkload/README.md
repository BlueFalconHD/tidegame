# Runtime chunk-loading queue

`tide:runtime/chunkload` is a generic runtime service for work that must wait until a
rectangular set of chunks reports as loaded. It processes one request at a time, keeps
queued and active state across `/reload`, invokes the request callback, and releases the
temporary force-load range afterward.

The service does not know about worldgen, structure templates, markers, or entities. A
caller can include any additional data it needs in the request; the complete request is
passed to the callback as macro arguments.

## Public API

Datapack systems should call only these service functions:

- `tide:runtime/chunkload/enqueue`
- `tide:runtime/chunkload/cancel_active`
- `tide:runtime/chunkload/clear_pending`

## Enqueue a request

Write the request to `tide:chunkload request`, then call the enqueue function:

```mcfunction
data modify storage tide:chunkload request set value {dimension:"tide:ocean",callback:"tide:world/gen/job/place_ocean_island",x:160,y:34,z:-80,min_x:160,min_z:-80,max_x:261,max_z:12}
function tide:runtime/chunkload/enqueue
```

Required fields:

- `dimension`: dimension resource location in which the callback runs.
- `callback`: function resource location invoked when every required chunk is ready.
- `x`, `y`, `z`: absolute callback origin.
- `min_x`, `min_z`, `max_x`, `max_z`: inclusive block-space bounds to load.

## Callback

The callback runs in the requested dimension, positioned at `x y z`:

Callbacks therefore receive every request field as a macro argument. They must finish all
work that depends on the loaded chunks before returning. Return success when the work is
complete and `return fail` when it cannot be completed.

## Limits

- Requests are processed sequentially.
- A request may cover at most 256 chunks.
- At most 128 requests may wait in the queue.

## Operations

```mcfunction
# Cancel the active request and release its force-loaded range
function tide:runtime/chunkload/cancel_active

# Discard waiting requests without touching the active request
function tide:runtime/chunkload/clear_pending
```
