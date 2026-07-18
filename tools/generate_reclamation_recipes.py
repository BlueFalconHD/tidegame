#!/usr/bin/env python3
"""Generate Tide's deterministic reverse-crafting recipes."""

from __future__ import annotations

import json
import shutil
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "datapack" / "data" / "tide"
RECIPES = DATA / "recipe" / "reclamation"
TAGS = DATA / "tags" / "item" / "reclamation"
ADVANCEMENT = DATA / "advancement" / "reclamation" / "recipes.json"

WOOD_TYPES = (
    "oak",
    "spruce",
    "birch",
    "jungle",
    "acacia",
    "dark_oak",
    "mangrove",
    "cherry",
    "pale_oak",
    "bamboo",
    "crimson",
    "warped",
)

MASONRY_WITH_WALLS = (
    ("cobblestone", "cobblestone"),
    ("mossy_cobblestone", "mossy_cobblestone"),
    ("stone_brick", "stone_bricks"),
    ("mossy_stone_brick", "mossy_stone_bricks"),
    ("granite", "granite"),
    ("diorite", "diorite"),
    ("andesite", "andesite"),
    ("cobbled_deepslate", "cobbled_deepslate"),
    ("polished_deepslate", "polished_deepslate"),
    ("deepslate_brick", "deepslate_bricks"),
    ("deepslate_tile", "deepslate_tiles"),
    ("brick", "bricks"),
    ("mud_brick", "mud_bricks"),
    ("sandstone", "sandstone"),
    ("red_sandstone", "red_sandstone"),
    ("prismarine", "prismarine"),
    ("nether_brick", "nether_bricks"),
    ("red_nether_brick", "red_nether_bricks"),
    ("blackstone", "blackstone"),
    ("polished_blackstone", "polished_blackstone"),
    ("polished_blackstone_brick", "polished_blackstone_bricks"),
    ("end_stone_brick", "end_stone_bricks"),
    ("resin_brick", "resin_bricks"),
    ("tuff", "tuff"),
    ("polished_tuff", "polished_tuff"),
    ("tuff_brick", "tuff_bricks"),
)

MASONRY_STAIRS_AND_SLABS = (
    ("stone", "stone"),
    ("polished_granite", "polished_granite"),
    ("polished_diorite", "polished_diorite"),
    ("polished_andesite", "polished_andesite"),
    ("smooth_sandstone", "smooth_sandstone"),
    ("smooth_red_sandstone", "smooth_red_sandstone"),
    ("prismarine_brick", "prismarine_bricks"),
    ("dark_prismarine", "dark_prismarine"),
    ("quartz", "quartz_block"),
    ("smooth_quartz", "smooth_quartz"),
    ("purpur", "purpur_block"),
)

MASONRY_SLABS = (
    ("smooth_stone", "smooth_stone"),
    ("cut_sandstone", "cut_sandstone"),
    ("cut_red_sandstone", "cut_red_sandstone"),
)

COPPER_STATES = (
    "copper",
    "exposed_copper",
    "weathered_copper",
    "oxidized_copper",
    "waxed_copper",
    "waxed_exposed_copper",
    "waxed_weathered_copper",
    "waxed_oxidized_copper",
)


recipe_ids: list[str] = []


def write_json(path: Path, data: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(data, indent=2) + "\n")


def ingredient(item: str, count: int) -> list[str]:
    return [item] * count


def add_recipe(
    relative_path: str,
    inputs: list[str],
    output: str,
    output_count: int,
    group: str,
    category: str = "building",
) -> None:
    write_json(
        RECIPES / f"{relative_path}.json",
        {
            "type": "minecraft:crafting_shapeless",
            "category": category,
            "group": f"tide:reclamation/{group}",
            "ingredients": inputs,
            "result": {"count": output_count, "id": f"minecraft:{output}"},
        },
    )
    recipe_ids.append(f"tide:reclamation/{relative_path}")


def add_tag(relative_path: str, values: list[str]) -> str:
    write_json(
        TAGS / f"{relative_path}.json",
        {"values": [f"minecraft:{value}" for value in values]},
    )
    return f"#tide:reclamation/{relative_path}"


def generate_wood_recipes() -> None:
    returns = (
        ("stairs", 2, 2),
        ("slab", 3, 1),
        ("trapdoor", 1, 2),
        ("door", 2, 3),
        ("fence", 3, 2),
        ("fence_gate", 1, 1),
        ("shelf", 1, 2),
        ("sign", 2, 1),
    )
    for wood in WOOD_TYPES:
        planks = f"{wood}_planks"
        for shape, input_count, output_count in returns:
            add_recipe(
                f"wood/{wood}/{shape}",
                ingredient(f"minecraft:{wood}_{shape}", input_count),
                planks,
                output_count,
                planks,
            )


def generate_masonry_recipes() -> None:
    for shape, result in MASONRY_WITH_WALLS:
        add_recipe(
            f"masonry/{shape}/stairs",
            ingredient(f"minecraft:{shape}_stairs", 2),
            result,
            1,
            result,
        )
        add_recipe(
            f"masonry/{shape}/slab",
            ingredient(f"minecraft:{shape}_slab", 3),
            result,
            1,
            result,
        )
        # Wreck builders use mud brick walls as dark, waterlogged timber.
        wall_result = "spruce_planks" if shape == "mud_brick" else result
        add_recipe(
            f"masonry/{shape}/wall",
            ingredient(f"minecraft:{shape}_wall", 2),
            wall_result,
            1,
            wall_result,
        )

    for shape, result in MASONRY_STAIRS_AND_SLABS:
        add_recipe(
            f"masonry/{shape}/stairs",
            ingredient(f"minecraft:{shape}_stairs", 2),
            result,
            1,
            result,
        )
        add_recipe(
            f"masonry/{shape}/slab",
            ingredient(f"minecraft:{shape}_slab", 3),
            result,
            1,
            result,
        )

    for shape, result in MASONRY_SLABS:
        add_recipe(
            f"masonry/{shape}/slab",
            ingredient(f"minecraft:{shape}_slab", 3),
            result,
            1,
            result,
        )


def generate_material_recipes() -> None:
    recipes = (
        ("fiber/wool", ["#minecraft:wool"], "string", 2, "string"),
        ("fiber/carpet", ingredient("#minecraft:wool_carpets", 3), "string", 3, "string"),
        ("fiber/banner", ["#minecraft:banners"], "string", 3, "string"),
        ("fiber/bed", ["#minecraft:beds"], "string", 3, "string"),
        ("fiber/cobweb", ["minecraft:cobweb"], "string", 3, "string"),
        ("fuel/campfire", ["minecraft:campfire"], "charcoal", 1, "charcoal"),
        ("fuel/soul_campfire", ["minecraft:soul_campfire"], "charcoal", 1, "charcoal"),
        ("metal/iron_door", ["minecraft:iron_door"], "iron_nugget", 4, "iron_nugget"),
        ("metal/iron_trapdoor", ["minecraft:iron_trapdoor"], "iron_nugget", 6, "iron_nugget"),
        ("metal/iron_chain", ["minecraft:iron_chain"], "iron_nugget", 2, "iron_nugget"),
        ("metal/iron_bars", ingredient("minecraft:iron_bars", 4), "iron_nugget", 3, "iron_nugget"),
        ("metal/rail", ingredient("minecraft:rail", 2), "iron_nugget", 1, "iron_nugget"),
        ("metal/anvil", ["#minecraft:anvil"], "iron_ingot", 4, "iron_ingot"),
        ("metal/tripwire_hook", ["minecraft:tripwire_hook"], "iron_nugget", 1, "iron_nugget"),
        (
            "metal/heavy_weighted_pressure_plate",
            ["minecraft:heavy_weighted_pressure_plate"],
            "iron_ingot",
            1,
            "iron_ingot",
        ),
    )
    for path, inputs, output, count, group in recipes:
        add_recipe(path, inputs, output, count, group, "misc")

    containers = add_tag(
        "wooden_containers",
        ["barrel", "chest", "trapped_chest"],
    )
    add_recipe("wood/container", [containers], "oak_planks", 4, "oak_planks")


def copper_variants(part: str) -> list[str]:
    values = []
    for state in COPPER_STATES:
        if state == "copper":
            values.append(f"copper_{part}")
        elif state == "waxed_copper":
            values.append(f"waxed_copper_{part}")
        else:
            adjective = state.removesuffix("_copper")
            values.append(f"{adjective}_copper_{part}")
    return values


def generate_copper_recipes() -> None:
    cut_blocks = add_tag(
        "copper/cut_blocks",
        [
            "cut_copper",
            "exposed_cut_copper",
            "weathered_cut_copper",
            "oxidized_cut_copper",
            "waxed_cut_copper",
            "waxed_exposed_cut_copper",
            "waxed_weathered_cut_copper",
            "waxed_oxidized_cut_copper",
        ],
    )
    stairs_and_trapdoors = add_tag(
        "copper/stairs_and_trapdoors",
        [
            "cut_copper_stairs",
            "exposed_cut_copper_stairs",
            "weathered_cut_copper_stairs",
            "oxidized_cut_copper_stairs",
            "waxed_cut_copper_stairs",
            "waxed_exposed_cut_copper_stairs",
            "waxed_weathered_cut_copper_stairs",
            "waxed_oxidized_cut_copper_stairs",
            *copper_variants("trapdoor"),
        ],
    )
    slabs_and_grates = add_tag(
        "copper/slabs_and_grates",
        [
            "cut_copper_slab",
            "exposed_cut_copper_slab",
            "weathered_cut_copper_slab",
            "oxidized_cut_copper_slab",
            "waxed_cut_copper_slab",
            "waxed_exposed_cut_copper_slab",
            "waxed_weathered_cut_copper_slab",
            "waxed_oxidized_cut_copper_slab",
            *copper_variants("grate"),
        ],
    )
    fittings = add_tag(
        "copper/fittings",
        [
            *copper_variants("bars"),
            *copper_variants("chain"),
            *copper_variants("lantern"),
            *copper_variants("bulb"),
        ],
    )
    doors = add_tag("copper/doors", copper_variants("door"))

    add_recipe("copper/cut_block", [cut_blocks], "copper_ingot", 2, "copper_ingot", "misc")
    add_recipe(
        "copper/stairs_and_trapdoors",
        ingredient(stairs_and_trapdoors, 2),
        "copper_ingot",
        3,
        "copper_ingot",
        "misc",
    )
    add_recipe(
        "copper/slabs_and_grates",
        ingredient(slabs_and_grates, 2),
        "copper_ingot",
        1,
        "copper_ingot",
        "misc",
    )
    add_recipe(
        "copper/fittings",
        ingredient(fittings, 3),
        "copper_ingot",
        1,
        "copper_ingot",
        "misc",
    )
    add_recipe(
        "copper/doors",
        ingredient(doors, 2),
        "copper_ingot",
        3,
        "copper_ingot",
        "misc",
    )
    add_recipe(
        "copper/chest",
        ["#minecraft:copper_chests"],
        "copper_ingot",
        4,
        "copper_ingot",
        "misc",
    )


def write_unlock_advancement() -> None:
    write_json(
        ADVANCEMENT,
        {
            "criteria": {
                "has_crowbar": {
                    "trigger": "minecraft:inventory_changed",
                    "conditions": {
                        "items": [
                            {
                                "items": "minecraft:iron_pickaxe",
                                "predicates": {
                                    "minecraft:custom_data": "{tide:{salvage_crowbar:1b}}"
                                },
                            }
                        ]
                    },
                }
            },
            "rewards": {"recipes": sorted(recipe_ids)},
        },
    )


def main() -> None:
    shutil.rmtree(RECIPES, ignore_errors=True)
    shutil.rmtree(TAGS, ignore_errors=True)
    generate_wood_recipes()
    generate_masonry_recipes()
    generate_material_recipes()
    generate_copper_recipes()
    write_unlock_advancement()
    print(f"Generated {len(recipe_ids)} reclamation recipes.")


if __name__ == "__main__":
    main()
