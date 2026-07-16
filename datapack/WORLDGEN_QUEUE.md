# Worldgen chunk queue

`tide:world/gen/queue` runs one job at a time. It adds forced-chunk tickets, polls every
required chunk with `execute if loaded`, invokes the job callback only after every chunk
is entity-ticking, then removes only the tickets that the job itself added.

Queue and active-job state live in `tide:worldgen`, so `/reload` and normal server
restarts do not lose an in-flight job. A callback is synchronous: all commands that need
the loaded area must finish before it returns. Queue a follow-up job if more work is
needed later.

## Direct enqueue

Write a request and call the enqueue function:

```mcfunction
data modify storage tide:worldgen request set value {dimension:"tide:ocean",callback:"tide:world/gen/job/place_template",template:"tide:ocean/small_island",x:160,y:34,z:-80,min_x:160,min_z:-80,max_x:207,max_z:-33,payload:{kind:"small_island"}}
execute store success score #queued tide.wgen run function tide:world/gen/queue/enqueue
```

Required fields:

- `dimension`: dimension resource location in which tickets and the callback run.
- `callback`: function resource location called once all chunks are ready.
- `x`, `y`, `z`: absolute callback origin.
- `min_x`, `min_z`, `max_x`, `max_z`: inclusive block-space bounds to load.

Optional fields:

- `timeout_ticks`: per-job override. `0` waits forever.
- `on_failure`: callback for timeout, acquisition failure, callback failure, or cancel.
- `payload` and any other top-level fields: preserved and available to callback macros.

The enqueue function returns the assigned positive job id on success. On failure it
returns failure and writes a diagnostic to `tide:worldgen last_error`. The most recently
queued and completed/failed records are available at `last_enqueued` and `last_job`.

Callbacks receive the entire active job as macro arguments and run `positioned` at the
job origin in the requested dimension. They must return success. A template callback,
for example, should use `return run place template ...`; the supplied
`tide:world/gen/job/place_template` does this and expects a top-level `template` field.

## Enqueue from a marker in an unloaded chunk

Set local bounds relative to the marker, then summon it and immediately capture it as
the command source. This does not use a selector after the summon:

```mcfunction
data modify storage tide:worldgen request set value {dimension:"tide:ocean",callback:"tide:world/gen/job/place_template",template:"tide:ocean/small_island",min_offset_x:-24,min_offset_z:-24,max_offset_x:23,max_offset_z:23,payload:{kind:"small_island"}}
execute in tide:ocean positioned 160 34 -80 summon minecraft:marker run function tide:world/gen/queue/enqueue_marker
```

The helper floors the marker position to block coordinates, converts the four local
offsets into absolute bounds, stores its UUID as top-level `marker_uuid`, and queues the
job. Missing offsets default to zero. It kills the new marker if validation fails.

After readiness, a callback can target that exact marker with a macro selector if it
needs the marker's entity data:

```mcfunction
$execute as @e[type=minecraft:marker,nbt={UUID:$(marker_uuid)},limit=1] at @s run function tide:world/gen/my_structure/build
return 1
```

Alternatively set `callback:"tide:world/gen/job/run_as_marker"` and put the function
that should run as the marker in top-level `marker_callback`; the supplied adapter does
the UUID selection and propagates the nested callback's return value.

## Limits and configuration

Defaults are a 5-by-5 span, 25 total chunks, 128 pending jobs, and a 1,200-tick timeout:

```snbt
{max_span:5,max_chunks:25,max_queue:128,timeout_ticks:1200}
```

Change individual settings in `tide:worldgen config`. The queue also has a hard
256-chunk-per-job safety ceiling.

The checked-in `tide:ocean/island` template is 102 by 43 by 93 blocks. It needs 7 by 6
chunks when its origin is chunk-aligned, and can touch as many as 8 by 7 (56 chunks) at
an arbitrary block offset. Either shrink/split it, align it and set limits to at least
`max_span:7,max_chunks:42`, or support arbitrary offsets with:

```mcfunction
data modify storage tide:worldgen config.max_span set value 8
data modify storage tide:worldgen config.max_chunks set value 56
```

Vanilla 1.21.10's `/forceload` range command permits 256 chunks per invocation, not 25;
the lower defaults here are an intentional server-load budget.

## Operations

```mcfunction
# Inspect state
data get storage tide:worldgen

# Fail the active job, invoke on_failure if present, and release owned tickets
function tide:world/gen/queue/cancel_active

# Discard waiting jobs without touching the active job
function tide:world/gen/queue/clear_pending
```
