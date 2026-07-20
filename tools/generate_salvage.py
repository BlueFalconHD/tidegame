#!/usr/bin/env python3
"""Generate Tide's crowbars, salvage loot overrides, recovery, and finds."""

from __future__ import annotations

import argparse
import copy
import json
import math
import sys
import zipfile
from collections import Counter, defaultdict
from pathlib import Path
from typing import Any

from salvage_manifest import (
    BED_BLOCKS,
    BLOCK_MATERIALS,
    DEFAULT_UNLOCK_SPEEDS,
    DOOR_BLOCKS,
    INTACT_ITEM_OVERRIDES,
    LOOT_TABLE_OVERRIDES,
    MATERIALS,
    SLAB_BLOCKS,
    guaranteed_salvage_drop,
    hardness_tier,
    salvage_units,
    unlock_speed,
)


ROOT = Path(__file__).resolve().parents[1]
DATAPACK = ROOT / "datapack"
RETURN_RATE = 0.88
SPEED_GROWTH = 1.70
INTACT_CHANCE_PER_TIER = 0.025


def namespaced(identifier: str) -> str:
    return identifier if ":" in identifier else f"minecraft:{identifier}"


def validate_manifest() -> None:
    base_items = [material.base_item for material in MATERIALS.values()]
    if len(base_items) != len(set(base_items)):
        duplicates = sorted(item for item, count in Counter(base_items).items() if count > 1)
        raise SystemExit(f"Salvage base items must be unique: {', '.join(duplicates)}")

    tiers = {hardness_tier(block, material_id) for block, material_id in BLOCK_MATERIALS.items()}
    if tiers != set(range(1, 11)):
        raise SystemExit(f"Every hardness tier must be represented; found {sorted(tiers)}")

    supported_stations = {"campfire", "stonecutter", "blast_furnace"}
    for material_id, material in MATERIALS.items():
        if material.station not in supported_stations:
            raise SystemExit(f"Unsupported recovery station for {material_id}: {material.station}")
        if not material.recovery_outputs:
            raise SystemExit(f"No recovery outputs declared for {material_id}")


def write_json(path: Path, value: Any, check: bool) -> bool:
    rendered = json.dumps(value, indent=2, ensure_ascii=False) + "\n"
    if check:
        return path.is_file() and path.read_text() == rendered
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(rendered)
    return True


def write_text(path: Path, value: str, check: bool) -> bool:
    rendered = value if value.endswith("\n") else value + "\n"
    if check:
        return path.is_file() and path.read_text() == rendered
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(rendered)
    return True


def custom_data_predicate(snbt: str) -> dict[str, Any]:
    return {
        "items": "minecraft:breeze_rod",
        "predicates": {"minecraft:custom_data": snbt},
    }


def location_condition() -> dict[str, Any]:
    return {
        "condition": "minecraft:location_check",
        "predicate": {"dimension": "tide:ocean"},
    }


def crowbar_condition(tier: int | None = None) -> dict[str, Any]:
    data = "{tide:{crowbar:1b}}" if tier is None else f"{{tide:{{crowbar:1b,crowbar_tier:{tier}b}}}}"
    return {
        "condition": "minecraft:match_tool",
        "predicate": custom_data_predicate(data),
    }


def exact_block_condition(block: str) -> dict[str, Any]:
    return {
        "block": namespaced(block),
        "condition": "minecraft:block_state_property",
    }


def any_block_condition(blocks: tuple[str, ...]) -> dict[str, Any]:
    conditions = [exact_block_condition(block) for block in blocks]
    if len(conditions) == 1:
        return conditions[0]
    return {
        "condition": "minecraft:any_of",
        "terms": conditions,
    }


def salvage_context(blocks: tuple[str, ...]) -> list[dict[str, Any]]:
    return [location_condition(), crowbar_condition(), any_block_condition(blocks)]


def outside_salvage_context(blocks: tuple[str, ...]) -> dict[str, Any]:
    return {
        "condition": "minecraft:inverted",
        "term": {
            "condition": "minecraft:all_of",
            "terms": salvage_context(blocks),
        },
    }


def block_state_condition(block: str, properties: dict[str, str]) -> dict[str, Any]:
    return {
        "block": namespaced(block),
        "condition": "minecraft:block_state_property",
        "properties": properties,
    }


def eligible_block_conditions(block: str) -> list[dict[str, Any]]:
    if block in DOOR_BLOCKS:
        return [block_state_condition(block, {"half": "lower"})]
    if block in BED_BLOCKS:
        return [block_state_condition(block, {"part": "head"})]
    return []


def count_function(expected_units: float, add: bool = False) -> dict[str, Any]:
    if expected_units == 1.0:
        return {
            "add": add,
            "count": 1.0,
            "function": "minecraft:set_count",
        }

    trials = max(1, math.ceil(expected_units))
    probability = min(1.0, expected_units * RETURN_RATE / trials)
    return {
        "add": add,
        "count": {
            "type": "minecraft:binomial",
            "n": float(trials),
            "p": round(probability, 6),
        },
        "function": "minecraft:set_count",
    }


def crowbar_tier_for_hardness(hardness: int) -> int:
    if hardness <= 5:
        return 1
    if hardness <= 8:
        return hardness - 4
    return 5


def max_hardness_for_crowbar(crowbar_tier: int) -> int:
    return (5, 6, 7, 8, 10)[crowbar_tier - 1]


def intact_entry(block: str, tier: int, count: int) -> dict[str, Any]:
    entry: dict[str, Any] = {
        "type": "minecraft:item",
        "conditions": [
            crowbar_condition(tier),
            {
                "chance": round(INTACT_CHANCE_PER_TIER * tier, 4),
                "condition": "minecraft:random_chance",
            },
        ],
        "name": namespaced(INTACT_ITEM_OVERRIDES.get(block, block)),
    }
    if count != 1:
        entry["functions"] = [
            {
                "add": False,
                "count": float(count),
                "function": "minecraft:set_count",
            }
        ]
    return entry


def salvage_entry(block: str, material_id: str, units: float) -> dict[str, Any]:
    functions = [count_function(units)]
    if guaranteed_salvage_drop(block) and units > 1.0:
        functions = [count_function(1.0), count_function(units - 1.0, add=True)]
    return {
        "type": "minecraft:loot_table",
        "functions": functions,
        "value": f"tide:salvage/material/{material_id}",
    }


def salvage_drop_pool(
    block: str,
    material_id: str,
    units: float,
    intact_count: int = 1,
    state_conditions: tuple[dict[str, Any], ...] = (),
) -> dict[str, Any]:
    return {
        "bonus_rolls": 0.0,
        "conditions": salvage_context((block,))
        + eligible_block_conditions(block)
        + list(state_conditions),
        "entries": [
            {
                "type": "minecraft:alternatives",
                "children": [
                    *(intact_entry(block, tier, intact_count) for tier in range(1, 6)),
                    salvage_entry(block, material_id, units),
                ],
            }
        ],
        "rolls": 1.0,
    }


def find_pool(block: str, hardness: int) -> dict[str, Any]:
    chance = round(0.004 + 0.003 * hardness, 4)
    return {
        "bonus_rolls": 0.0,
        "conditions": salvage_context((block,))
        + eligible_block_conditions(block)
        + [{"chance": chance, "condition": "minecraft:random_chance"}],
        "entries": [
            {
                "type": "minecraft:loot_table",
                "value": "tide:salvage/finds",
            }
        ],
        "rolls": 1.0,
    }


def block_override(vanilla: dict[str, Any], block_entries: list[tuple[str, str]]) -> dict[str, Any]:
    result = copy.deepcopy(vanilla)
    blocks = tuple(block for block, _ in block_entries)
    for pool in result.get("pools", []):
        pool.setdefault("conditions", []).append(outside_salvage_context(blocks))

    for block, material_id in block_entries:
        hardness = hardness_tier(block, material_id)
        units = salvage_units(block, material_id)
        if block in SLAB_BLOCKS:
            is_double = block_state_condition(block, {"type": "double"})
            is_not_double = {
                "condition": "minecraft:inverted",
                "term": is_double,
            }
            result.setdefault("pools", []).extend(
                [
                    salvage_drop_pool(block, material_id, units, state_conditions=(is_not_double,)),
                    salvage_drop_pool(
                        block,
                        material_id,
                        units * 2.0,
                        intact_count=2,
                        state_conditions=(is_double,),
                    ),
                ]
            )
        else:
            result.setdefault("pools", []).append(salvage_drop_pool(block, material_id, units))
        result["pools"].append(find_pool(block, hardness))
    return result


def crowbar_rules(crowbar_tier: int) -> list[dict[str, Any]]:
    rules: list[dict[str, Any]] = []
    blocks_by_hardness: dict[int, list[str]] = defaultdict(list)
    for block, material_id in BLOCK_MATERIALS.items():
        blocks_by_hardness[hardness_tier(block, material_id)].append(block)

    for hardness in range(1, 11):
        unlock_tier = crowbar_tier_for_hardness(hardness)
        if crowbar_tier < unlock_tier:
            rules.append(
                {
                    "blocks": f"#tide:salvage/hardness/tier_{hardness}",
                    "speed": round(2.0 / (2 ** (unlock_tier - crowbar_tier - 1)), 3),
                    "correct_for_drops": True,
                }
            )
            continue

        multiplier = SPEED_GROWTH ** (crowbar_tier - unlock_tier)
        overrides: dict[float, list[str]] = defaultdict(list)
        for block in blocks_by_hardness[hardness]:
            speed = unlock_speed(block, hardness)
            if speed != DEFAULT_UNLOCK_SPEEDS[hardness]:
                overrides[round(speed * multiplier, 3)].append(block)

        for speed, blocks in sorted(overrides.items()):
            rules.append(
                {
                    "blocks": [namespaced(block) for block in sorted(blocks)],
                    "speed": speed,
                    "correct_for_drops": True,
                }
            )

        rules.append(
            {
                "blocks": f"#tide:salvage/hardness/tier_{hardness}",
                "speed": round(DEFAULT_UNLOCK_SPEEDS[hardness] * multiplier, 3),
                "correct_for_drops": True,
            }
        )

    rules.append(
        {
            "blocks": "#minecraft:mineable/axe",
            "speed": round(DEFAULT_UNLOCK_SPEEDS[5] * (SPEED_GROWTH ** (crowbar_tier - 1)), 3),
            "correct_for_drops": True,
        }
    )
    return rules


def roman(value: int) -> str:
    return ("I", "II", "III", "IV", "V")[value - 1]


def crowbar_table(tier: int) -> dict[str, Any]:
    return {
        "type": "minecraft:command",
        "pools": [
            {
                "rolls": 1,
                "entries": [
                    {
                        "type": "minecraft:item",
                        "name": "minecraft:breeze_rod",
                        "functions": [
                            {
                                "function": "minecraft:set_components",
                                "components": {
                                    "minecraft:item_name": {
                                        "text": "Salvage Crowbar",
                                        "color": "#F2F2F2",
                                        "italic": False,
                                    },
                                    "minecraft:lore": [
                                        {
                                            "text": (
                                                f"Tier {roman(tier)} · Efficient through Hardness "
                                                f"{max_hardness_for_crowbar(tier)}"
                                            ),
                                            "color": "#E0CA8E",
                                            "italic": False,
                                        },
                                        {
                                            "text": "New materials start slow; earlier ones get faster.",
                                            "color": "gray",
                                            "italic": False,
                                        },
                                    ],
                                    "minecraft:item_model": "tide:crowbar",
                                    "minecraft:max_stack_size": 1,
                                    "minecraft:max_damage": 64,
                                    "minecraft:damage": 0,
                                    "minecraft:tool": {
                                        "rules": crowbar_rules(tier),
                                        "default_mining_speed": 1.0,
                                        "damage_per_block": 1,
                                    },
                                    "minecraft:custom_data": {
                                        "tide": {
                                            "crowbar": True,
                                            "crowbar_tier": tier,
                                        }
                                    },
                                },
                            }
                        ],
                    }
                ],
            }
        ],
    }


def material_table(material_id: str) -> dict[str, Any]:
    material = MATERIALS[material_id]
    station_copy = {
        "campfire": "Dry at a campfire.",
        "stonecutter": "Clean at a stonecutter.",
        "blast_furnace": "Refine in a blast furnace.",
    }[material.station]
    return {
        "type": "minecraft:command",
        "pools": [
            {
                "rolls": 1,
                "entries": [
                    {
                        "type": "minecraft:item",
                        "name": namespaced(material.base_item),
                        "functions": [
                            {
                                "function": "minecraft:set_components",
                                "components": {
                                    "minecraft:item_name": {
                                        "text": material.display_name,
                                        "color": "#F2F2F2",
                                        "italic": False,
                                    },
                                    "minecraft:lore": [
                                        {
                                            "text": station_copy,
                                            "color": "gray",
                                            "italic": False,
                                        }
                                    ],
                                    "minecraft:item_model": namespaced(material.item_model),
                                    "minecraft:max_stack_size": 64,
                                    "minecraft:custom_data": {
                                        "tide": {
                                            "salvage_material": material_id,
                                        }
                                    },
                                },
                            }
                        ],
                    }
                ],
            }
        ],
    }


def treasure_item(
    base_item: str,
    display_name: str,
    lore: str,
    treasure_id: str,
    model: str | None = None,
) -> dict[str, Any]:
    components: dict[str, Any] = {
        "minecraft:item_name": {
            "text": display_name,
            "color": "#E0CA8E",
            "italic": False,
        },
        "minecraft:lore": [
            {
                "text": lore,
                "color": "gray",
                "italic": False,
            }
        ],
        "minecraft:custom_data": {
            "tide": {
                "treasure": treasure_id,
            }
        },
    }
    if model is not None:
        components["minecraft:item_model"] = namespaced(model)
    return {
        "type": "minecraft:command",
        "pools": [
            {
                "rolls": 1,
                "entries": [
                    {
                        "type": "minecraft:item",
                        "name": namespaced(base_item),
                        "functions": [
                            {
                                "function": "minecraft:set_components",
                                "components": components,
                            }
                        ],
                    }
                ],
            }
        ],
    }


def finds_table() -> dict[str, Any]:
    return {
        "type": "minecraft:block",
        "pools": [
            {
                "rolls": 1,
                "entries": [
                    {
                        "type": "minecraft:loot_table",
                        "value": "tide:salvage/treasure/coin",
                        "weight": 72,
                        "functions": [
                            {
                                "function": "minecraft:set_count",
                                "count": {
                                    "type": "minecraft:uniform",
                                    "min": 1.0,
                                    "max": 3.0,
                                },
                            }
                        ],
                    },
                    {
                        "type": "minecraft:loot_table",
                        "value": "tide:salvage/treasure/sea_glass",
                        "weight": 18,
                    },
                    {
                        "type": "minecraft:loot_table",
                        "value": "tide:salvage/treasure/message_bottle",
                        "weight": 8,
                    },
                    {
                        "type": "minecraft:loot_table",
                        "value": "tide:salvage/treasure/pearl",
                        "weight": 2,
                    },
                ],
            }
        ],
    }


def recovery_recipes() -> dict[Path, dict[str, Any]]:
    recipes: dict[Path, dict[str, Any]] = {}
    base = DATAPACK / "data/tide/recipe/salvage/recovery"
    for material_id, material in MATERIALS.items():
        ingredient = namespaced(material.base_item)
        if material.station == "campfire":
            output, count = material.recovery_outputs[0]
            recipes[base / f"campfire/{material_id}.json"] = {
                "type": "minecraft:campfire_cooking",
                "category": "misc",
                "cookingtime": 200,
                "experience": 0.0,
                "ingredient": ingredient,
                "result": {
                    "count": count,
                    "id": namespaced(output),
                },
            }
        elif material.station == "blast_furnace":
            output, count = material.recovery_outputs[0]
            recipes[base / f"blasting/{material_id}.json"] = {
                "type": "minecraft:blasting",
                "category": "misc",
                "cookingtime": 100,
                "experience": 0.1,
                "ingredient": ingredient,
                "result": {
                    "count": count,
                    "id": namespaced(output),
                },
            }
        elif material.station == "stonecutter":
            for output, count in material.recovery_outputs:
                recipes[base / f"stonecutting/{material_id}/{output}.json"] = {
                    "type": "minecraft:stonecutting",
                    "ingredient": ingredient,
                    "result": {
                        "count": count,
                        "id": namespaced(output),
                    },
                }
    return recipes


def generate(vanilla_jar: Path, check: bool) -> int:
    validate_manifest()
    outputs: dict[Path, Any] = {}
    text_outputs: dict[Path, str] = {}

    blocks_by_hardness: dict[int, list[str]] = defaultdict(list)
    for block, material_id in BLOCK_MATERIALS.items():
        blocks_by_hardness[hardness_tier(block, material_id)].append(block)
    for hardness in range(1, 11):
        outputs[DATAPACK / f"data/tide/tags/block/salvage/hardness/tier_{hardness}.json"] = {
            "values": [namespaced(block) for block in sorted(blocks_by_hardness[hardness])]
        }

    for tier in range(1, 6):
        outputs[DATAPACK / f"data/tide/loot_table/item/crowbar/tier_{tier}.json"] = crowbar_table(tier)
        text_outputs[DATAPACK / f"data/tide/function/item/crowbar/give/tier_{tier}.mcfunction"] = (
            f"loot give @s loot tide:item/crowbar/tier_{tier}\n"
        )

    outputs[DATAPACK / "data/tide/tags/item/salvage/reserved.json"] = {
        "values": [namespaced(material.base_item) for material in MATERIALS.values()]
    }
    for material_id in MATERIALS:
        outputs[DATAPACK / f"data/tide/loot_table/salvage/material/{material_id}.json"] = material_table(material_id)

    treasures = {
        "coin": treasure_item("sunflower", "Old Coin", "Weathered currency from a lost voyage.", "coin"),
        "sea_glass": treasure_item("amethyst_shard", "Sea Glass", "The ocean has worn every edge smooth.", "sea_glass"),
        "message_bottle": treasure_item(
            "glass_bottle",
            "Message Bottle",
            "The writing inside has long since washed away.",
            "message_bottle",
        ),
        "pearl": treasure_item(
            "nautilus_shell",
            "Pearlescent Keepsake",
            "Small enough to have been carried for luck.",
            "pearl",
        ),
    }
    for treasure_id, table in treasures.items():
        outputs[DATAPACK / f"data/tide/loot_table/salvage/treasure/{treasure_id}.json"] = table
    outputs[DATAPACK / "data/tide/loot_table/salvage/finds.json"] = finds_table()
    outputs.update(recovery_recipes())

    blocks_by_loot_table: dict[str, list[tuple[str, str]]] = defaultdict(list)
    for block, material_id in sorted(BLOCK_MATERIALS.items()):
        blocks_by_loot_table[LOOT_TABLE_OVERRIDES.get(block, block)].append((block, material_id))

    with zipfile.ZipFile(vanilla_jar) as archive:
        for loot_table_id, block_entries in blocks_by_loot_table.items():
            source = f"data/minecraft/loot_table/blocks/{loot_table_id}.json"
            try:
                vanilla = json.loads(archive.read(source))
            except KeyError as error:
                raise SystemExit(f"Missing vanilla loot table: {source}") from error
            outputs[DATAPACK / f"data/minecraft/loot_table/blocks/{loot_table_id}.json"] = block_override(
                vanilla, block_entries
            )

    obsolete_crowbars = [
        DATAPACK / f"data/tide/loot_table/item/crowbar/tier_{tier}.json"
        for tier in range(6, 11)
    ] + [
        DATAPACK / f"data/tide/function/item/crowbar/give/tier_{tier}.mcfunction"
        for tier in range(6, 11)
    ]
    failures: list[Path] = []
    for path in obsolete_crowbars:
        if not path.exists():
            continue
        if check:
            failures.append(path)
        else:
            path.unlink()
    for path, value in outputs.items():
        if not write_json(path, value, check):
            failures.append(path)
    for path, value in text_outputs.items():
        if not write_text(path, value, check):
            failures.append(path)

    if failures:
        for path in failures:
            print(f"out of date: {path.relative_to(ROOT)}", file=sys.stderr)
        return 1
    action = "checked" if check else "generated"
    print(
        f"{action} {len(outputs) + len(text_outputs)} files: "
        f"{len(blocks_by_loot_table)} effective block overrides, {len(MATERIALS)} materials, 5 crowbars"
    )
    return 0


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--vanilla-jar", type=Path, required=True)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    if not args.vanilla_jar.is_file():
        parser.error(f"not a file: {args.vanilla_jar}")
    return generate(args.vanilla_jar, args.check)


if __name__ == "__main__":
    raise SystemExit(main())
