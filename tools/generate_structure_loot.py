#!/usr/bin/env python3
"""Generate Tide's unattached structure chest loot tables."""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path
from typing import Any


ROOT = Path(__file__).resolve().parents[1]
DATAPACK = ROOT / "datapack"
OUTPUT_ROOT = DATAPACK / "data/tide/loot_table/structure"


def namespaced(identifier: str) -> str:
    return identifier if ":" in identifier else f"minecraft:{identifier}"


def uniform(minimum: int | float, maximum: int | float) -> dict[str, Any]:
    return {
        "type": "minecraft:uniform",
        "min": float(minimum),
        "max": float(maximum),
    }


def set_count(count: int | tuple[int, int]) -> dict[str, Any]:
    value: float | dict[str, Any]
    if isinstance(count, tuple):
        value = uniform(*count)
    else:
        value = float(count)
    return {
        "function": "minecraft:set_count",
        "count": value,
        "add": False,
    }


def set_damage(minimum: float, maximum: float) -> dict[str, Any]:
    return {
        "function": "minecraft:set_damage",
        "damage": uniform(minimum, maximum),
        "add": False,
    }


def enchant_randomly() -> dict[str, Any]:
    return {
        "function": "minecraft:enchant_randomly",
        "options": "#minecraft:on_random_loot",
    }


def set_potion(potion: str) -> dict[str, Any]:
    return {
        "function": "minecraft:set_potion",
        "id": namespaced(potion),
    }


def item(
    identifier: str,
    *,
    weight: int = 1,
    count: int | tuple[int, int] | None = None,
    functions: tuple[dict[str, Any], ...] = (),
) -> dict[str, Any]:
    entry: dict[str, Any] = {
        "type": "minecraft:item",
        "name": namespaced(identifier),
    }
    if weight != 1:
        entry["weight"] = weight
    all_functions = list(functions)
    if count is not None:
        all_functions.insert(0, set_count(count))
    if all_functions:
        entry["functions"] = all_functions
    return entry


def nested_table(
    identifier: str,
    *,
    weight: int = 1,
    count: int | tuple[int, int] | None = None,
    functions: tuple[dict[str, Any], ...] = (),
) -> dict[str, Any]:
    entry: dict[str, Any] = {
        "type": "minecraft:loot_table",
        "value": identifier,
    }
    if weight != 1:
        entry["weight"] = weight
    all_functions = list(functions)
    if count is not None:
        all_functions.insert(0, set_count(count))
    if all_functions:
        entry["functions"] = all_functions
    return entry


def empty(*, weight: int = 1) -> dict[str, Any]:
    entry: dict[str, Any] = {"type": "minecraft:empty"}
    if weight != 1:
        entry["weight"] = weight
    return entry


def pool(
    entries: list[dict[str, Any]],
    *,
    rolls: int | tuple[int, int] = 1,
) -> dict[str, Any]:
    roll_value: float | dict[str, Any]
    if isinstance(rolls, tuple):
        roll_value = uniform(*rolls)
    else:
        roll_value = float(rolls)
    return {
        "rolls": roll_value,
        "bonus_rolls": 0.0,
        "entries": entries,
    }


def chest_table(identifier: str, pools: list[dict[str, Any]]) -> dict[str, Any]:
    return {
        "type": "minecraft:chest",
        "pools": pools,
        "random_sequence": f"tide:structure/{identifier}",
    }


def treasure(identifier: str, **kwargs: Any) -> dict[str, Any]:
    return nested_table(f"tide:salvage/treasure/{identifier}", **kwargs)


def shore_net_table() -> dict[str, Any]:
    return {
        "type": "minecraft:command",
        "pools": [
            pool(
                [
                    item(
                        "string",
                        functions=(
                            {
                                "function": "minecraft:set_components",
                                "components": {
                                    "minecraft:item_name": {
                                        "text": "Shore Net",
                                        "color": "#E0CA8E",
                                        "italic": False,
                                    },
                                    "minecraft:lore": [
                                        {
                                            "text": "Set it along your island's shore.",
                                            "color": "gray",
                                            "italic": False,
                                        },
                                        {
                                            "text": "Collects debris after a storm.",
                                            "color": "dark_gray",
                                            "italic": False,
                                        },
                                    ],
                                    "minecraft:item_model": "minecraft:cobweb",
                                    "minecraft:max_stack_size": 1,
                                    "minecraft:custom_data": {
                                        "tide": {"shore_net": True}
                                    },
                                },
                            },
                        ),
                    )
                ]
            )
        ],
    }


def starter_supplies() -> dict[str, Any]:
    return chest_table(
        "island/starter_supplies",
        [
            pool(
                [
                    item("bread", weight=5, count=(2, 4)),
                    item("baked_potato", weight=4, count=(3, 5)),
                    item("cooked_cod", weight=3, count=(2, 4)),
                ]
            ),
            pool(
                [
                    item("torch", weight=6, count=(4, 8)),
                    item("coal", weight=4, count=(2, 4)),
                    item("string", weight=4, count=(2, 4)),
                    item("glass_bottle", weight=3, count=(1, 2)),
                    item("fishing_rod", weight=2),
                ],
                rolls=2,
            ),
            pool(
                [
                    item("bundle", weight=3),
                    item("compass", weight=2),
                    treasure("message_bottle", weight=2),
                    empty(weight=8),
                ]
            ),
        ],
    )


def raft_provisions() -> dict[str, Any]:
    return chest_table(
        "abandoned_raft/provisions",
        [
            pool(
                [
                    item("dried_kelp", weight=7, count=(2, 5)),
                    item("bread", weight=5, count=(1, 3)),
                    item("cooked_cod", weight=4, count=(1, 3)),
                    item("baked_potato", weight=3, count=(2, 4)),
                ],
                rolls=2,
            ),
            pool(
                [
                    item("charcoal", weight=5, count=(1, 3)),
                    item("torch", weight=5, count=(2, 6)),
                    item("glass_bottle", weight=3, count=(1, 2)),
                    item("bowl", weight=2, count=(1, 2)),
                    item("fishing_rod", weight=2),
                ]
            ),
            pool(
                [
                    treasure("coin", weight=5, count=(1, 2)),
                    treasure("message_bottle", weight=2),
                    empty(weight=9),
                ]
            ),
        ],
    )


def raft_belongings() -> dict[str, Any]:
    return chest_table(
        "abandoned_raft/belongings",
        [
            pool(
                [
                    item("string", weight=8, count=(2, 5)),
                    item("stick", weight=7, count=(2, 5)),
                    item("paper", weight=6, count=(1, 4)),
                    item("feather", weight=5, count=(1, 3)),
                    item("leather", weight=4, count=(1, 3)),
                    item("iron_nugget", weight=4, count=(1, 4)),
                    item("iron_ingot", weight=2),
                    item("compass", weight=1),
                    item("bundle", weight=1),
                ],
                rolls=2,
            ),
            pool(
                [
                    treasure("coin", weight=5, count=(1, 3)),
                    treasure("message_bottle", weight=2),
                    treasure("sea_glass", weight=1),
                    empty(weight=12),
                ]
            ),
            pool(
                [
                    nested_table("tide:item/shore_net"),
                    empty(weight=19),
                ]
            ),
        ],
    )


def trawler_tool_locker() -> dict[str, Any]:
    return chest_table(
        "trawler/tool_locker",
        [
            pool(
                [
                    nested_table(
                        "tide:item/crowbar/tier_1",
                        functions=(set_damage(0.35, 0.75),),
                    )
                ]
            ),
            pool([item("iron_ingot", count=(1, 2))]),
            pool(
                [
                    item("coal", weight=7, count=(2, 5)),
                    item("torch", weight=6, count=(3, 7)),
                    item("iron_nugget", weight=5, count=(2, 6)),
                    item("shears", weight=3),
                    item("flint", weight=3, count=(1, 3)),
                    item("compass", weight=1),
                ],
                rolls=2,
            ),
        ],
    )


def trawler_tackle() -> dict[str, Any]:
    return chest_table(
        "trawler/tackle",
        [
            pool([item("string", count=(3, 7))]),
            pool([item("tripwire_hook", count=(1, 3))]),
            pool([nested_table("tide:item/shore_net"), empty()]),
            pool(
                [
                    item("fishing_rod", weight=10),
                    item("lead", weight=8, count=(1, 2)),
                    item("shears", weight=4),
                    item(
                        "fishing_rod",
                        weight=2,
                        functions=(enchant_randomly(),),
                    ),
                    item("nautilus_shell", weight=1),
                ]
            ),
        ],
    )


def trawler_catch() -> dict[str, Any]:
    return chest_table(
        "trawler/catch",
        [
            pool(
                [
                    item("cod", weight=10, count=(1, 3)),
                    item("salmon", weight=8, count=(1, 3)),
                    item("pufferfish", weight=3),
                    item("tropical_fish", weight=2),
                ],
                rolls=(3, 5),
            ),
            pool(
                [
                    item("bone", weight=7, count=(1, 3)),
                    item("ink_sac", weight=6, count=(1, 3)),
                    item("kelp", weight=6, count=(2, 5)),
                    item("prismarine_crystals", weight=3, count=(1, 3)),
                    item("nautilus_shell", weight=2),
                ],
                rolls=(1, 2),
            ),
            pool(
                [
                    treasure("sea_glass", weight=4),
                    treasure("pearl", weight=2),
                    treasure("message_bottle", weight=1),
                    item("heart_of_the_sea", weight=1),
                    empty(weight=12),
                ]
            ),
        ],
    )


def outpost_ammunition() -> dict[str, Any]:
    return chest_table(
        "outpost/ammunition",
        [
            pool(
                [
                    item("arrow", weight=10, count=(4, 10)),
                    item("gunpowder", weight=8, count=(1, 4)),
                    item("coal", weight=8, count=(2, 5)),
                    item("fire_charge", weight=5, count=(1, 3)),
                    item("firework_rocket", weight=4, count=(2, 5)),
                    item("iron_nugget", weight=3, count=(1, 3)),
                ],
                rolls=2,
            ),
            pool(
                [
                    item("tnt", weight=2),
                    item("spectral_arrow", weight=3, count=(2, 5)),
                    empty(weight=8),
                ]
            ),
        ],
    )


def outpost_provisions() -> dict[str, Any]:
    return chest_table(
        "outpost/provisions",
        [
            pool(
                [
                    item("bread", weight=8, count=(1, 3)),
                    item("baked_potato", weight=7, count=(2, 5)),
                    item("cooked_beef", weight=5, count=(1, 3)),
                    item("cooked_chicken", weight=5, count=(1, 3)),
                    item("honey_bottle", weight=4, count=(1, 2)),
                    item("torch", weight=5, count=(3, 7)),
                    item("leather", weight=3, count=(1, 3)),
                    item("coal", weight=4, count=(2, 5)),
                ],
                rolls=3,
            ),
            pool(
                [
                    item("iron_ingot", weight=3, count=(1, 2)),
                    item("shield", weight=2),
                    item("potion", weight=2, functions=(set_potion("healing"),)),
                    empty(weight=9),
                ]
            ),
        ],
    )


def outpost_command() -> dict[str, Any]:
    return chest_table(
        "outpost/command",
        [
            pool(
                [
                    item("crossbow", weight=5),
                    item("iron_sword", weight=4),
                    item("bow", weight=3, functions=(enchant_randomly(),)),
                ]
            ),
            pool([item("iron_ingot", count=(1, 3))]),
            pool(
                [
                    item("spyglass", weight=5),
                    item("compass", weight=5),
                    treasure("coin", weight=6, count=(2, 5)),
                    item("emerald", weight=4, count=(1, 2)),
                    item("gold_ingot", weight=3, count=(1, 2)),
                    item("book", weight=2, functions=(enchant_randomly(),)),
                ],
                rolls=2,
            ),
            pool(
                [
                    item("diamond", weight=2),
                    item("book", weight=3, functions=(enchant_randomly(),)),
                    item("coast_armor_trim_smithing_template"),
                    empty(weight=12),
                ]
            ),
        ],
    )


def ghost_ship_cargo() -> dict[str, Any]:
    return chest_table(
        "ghost_ship/cargo",
        [
            pool(
                [
                    item("gold_nugget", weight=8, count=(3, 8)),
                    item("gold_ingot", weight=4, count=(1, 3)),
                    item("emerald", weight=3, count=(1, 2)),
                    item("paper", weight=6, count=(2, 6)),
                    item("book", weight=4, count=(1, 3)),
                    item("dark_oak_planks", weight=5, count=(3, 8)),
                    item("smooth_quartz", weight=3, count=(1, 3)),
                    item("red_nether_bricks", weight=2, count=(1, 3)),
                ],
                rolls=3,
            ),
            pool(
                [
                    treasure("coin", weight=7, count=(2, 6)),
                    treasure("sea_glass", weight=3),
                    treasure("pearl", weight=1),
                    empty(weight=5),
                ]
            ),
        ],
    )


def ghost_ship_captain() -> dict[str, Any]:
    return chest_table(
        "ghost_ship/captain",
        [
            pool([treasure("message_bottle")]),
            pool(
                [
                    item("compass", weight=5),
                    item("clock", weight=4),
                    item("spyglass", weight=4),
                    item("book", weight=5, count=(1, 3)),
                    item("feather", weight=5, count=(1, 3)),
                    item("ink_sac", weight=4, count=(1, 3)),
                    item("gold_ingot", weight=3, count=(1, 2)),
                    treasure("coin", weight=6, count=(2, 5)),
                ],
                rolls=2,
            ),
            pool(
                [
                    item("book", weight=4, functions=(enchant_randomly(),)),
                    item("diamond", weight=2),
                    item("coast_armor_trim_smithing_template"),
                    empty(weight=10),
                ]
            ),
        ],
    )


def ghost_ship_crows_nest() -> dict[str, Any]:
    return chest_table(
        "ghost_ship/crows_nest",
        [
            pool(
                [
                    item("feather", weight=7, count=(2, 5)),
                    item("phantom_membrane", weight=4, count=(1, 2)),
                    item("spectral_arrow", weight=4, count=(2, 6)),
                    treasure("message_bottle", weight=4),
                    item("emerald", weight=3, count=(1, 2)),
                    treasure("coin", weight=6, count=(2, 5)),
                ],
                rolls=2,
            ),
            pool(
                [
                    item("diamond", weight=2),
                    treasure("pearl", weight=3),
                    empty(weight=10),
                ]
            ),
        ],
    )


def shipwreck_vault() -> dict[str, Any]:
    return chest_table(
        "shipwreck/vault",
        [
            pool([treasure("coin", count=(6, 12))]),
            pool(
                [
                    item("gold_ingot", weight=10, count=(3, 6)),
                    item("emerald", weight=8, count=(2, 5)),
                    item("diamond", weight=8, count=(1, 2)),
                    item("heart_of_the_sea", weight=4),
                    item("book", weight=4, functions=(enchant_randomly(),)),
                    item("coast_armor_trim_smithing_template", weight=2),
                    item("netherite_scrap", weight=1),
                ],
                rolls=2,
            ),
            pool(
                [
                    treasure("sea_glass", weight=4),
                    treasure("pearl", weight=2),
                    treasure("message_bottle", weight=2),
                    item("potion", weight=2, functions=(set_potion("water_breathing"),)),
                    empty(weight=6),
                ]
            ),
        ],
    )


def buried_treasure() -> dict[str, Any]:
    return chest_table(
        "buried_treasure",
        [
            pool([treasure("coin", count=(8, 16))]),
            pool(
                [
                    item("iron_ingot", weight=12, count=(1, 3)),
                    item("gold_ingot", weight=10, count=(1, 3)),
                    item("emerald", weight=8, count=(1, 3)),
                    item("prismarine_crystals", weight=6, count=(2, 5)),
                    item("diamond", weight=4, count=(1, 2)),
                ],
                rolls=(3, 5),
            ),
            pool(
                [
                    item("heart_of_the_sea", weight=3),
                    item("book", weight=5, functions=(enchant_randomly(),)),
                    item("coast_armor_trim_smithing_template", weight=2),
                    item("potion", weight=4, functions=(set_potion("water_breathing"),)),
                    item("netherite_scrap", weight=1),
                    treasure("pearl", weight=3),
                    treasure("sea_glass", weight=4),
                    empty(weight=7),
                ]
            ),
        ],
    )


def structure_tables() -> dict[str, dict[str, Any]]:
    return {
        "island/starter_supplies": starter_supplies(),
        "abandoned_raft/provisions": raft_provisions(),
        "abandoned_raft/belongings": raft_belongings(),
        "trawler/tool_locker": trawler_tool_locker(),
        "trawler/tackle": trawler_tackle(),
        "trawler/catch": trawler_catch(),
        "outpost/ammunition": outpost_ammunition(),
        "outpost/provisions": outpost_provisions(),
        "outpost/command": outpost_command(),
        "ghost_ship/cargo": ghost_ship_cargo(),
        "ghost_ship/captain": ghost_ship_captain(),
        "ghost_ship/crows_nest": ghost_ship_crows_nest(),
        "shipwreck/vault": shipwreck_vault(),
        "buried_treasure": buried_treasure(),
    }


def write_json(path: Path, value: dict[str, Any], check: bool) -> bool:
    rendered = json.dumps(value, indent=2, ensure_ascii=False) + "\n"
    if check:
        return path.is_file() and path.read_text() == rendered
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(rendered)
    return True


def generate(check: bool) -> int:
    outputs = {
        DATAPACK / "data/tide/loot_table/item/shore_net.json": shore_net_table(),
        **{
            OUTPUT_ROOT / f"{identifier}.json": table
            for identifier, table in structure_tables().items()
        },
    }
    failures = [path for path, value in outputs.items() if not write_json(path, value, check)]
    if failures:
        for path in failures:
            print(f"out of date: {path.relative_to(ROOT)}", file=sys.stderr)
        return 1
    action = "checked" if check else "generated"
    print(f"{action} {len(outputs)} loot files")
    return 0


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    return generate(args.check)


if __name__ == "__main__":
    raise SystemExit(main())
