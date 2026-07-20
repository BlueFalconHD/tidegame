"""Source-of-truth material and block catalog for Tide salvage generation."""

from __future__ import annotations

from dataclasses import dataclass


@dataclass(frozen=True)
class Material:
    base_item: str
    display_name: str
    item_model: str
    station: str
    recovery_outputs: tuple[tuple[str, int], ...]
    blocks: tuple[str, ...]


def _wood(
    base_item: str,
    display_name: str,
    item_model: str,
    output: str,
    *blocks: str,
) -> Material:
    return Material(
        base_item=base_item,
        display_name=display_name,
        item_model=item_model,
        station="campfire",
        recovery_outputs=((output, 1),),
        blocks=blocks,
    )


def _stone(
    base_item: str,
    display_name: str,
    item_model: str,
    outputs: tuple[tuple[str, int], ...],
    *blocks: str,
) -> Material:
    return Material(
        base_item=base_item,
        display_name=display_name,
        item_model=item_model,
        station="stonecutter",
        recovery_outputs=outputs,
        blocks=blocks,
    )


MATERIALS: dict[str, Material] = {
    "oak_timber": _wood(
        "angler_pottery_sherd",
        "Sodden Oak Timber",
        "oak_planks",
        "oak_planks",
        "beehive",
        "campfire",
        "composter",
        "ladder",
        "note_block",
        "oak_log",
        "oak_planks",
        "oak_shelf",
        "oak_slab",
        "oak_stairs",
        "oak_trapdoor",
        "oak_wall_sign",
        "oak_wood",
        "redstone_torch",
        "stripped_oak_log",
    ),
    "spruce_timber": _wood(
        "archer_pottery_sherd",
        "Sodden Spruce Timber",
        "spruce_planks",
        "spruce_planks",
        "spruce_door",
        "spruce_fence",
        "spruce_fence_gate",
        "spruce_log",
        "spruce_planks",
        "spruce_shelf",
        "spruce_slab",
        "spruce_stairs",
        "spruce_trapdoor",
        "spruce_wall_sign",
        "spruce_wood",
        "stripped_spruce_log",
        "stripped_spruce_wood",
    ),
    "birch_timber": _wood(
        "arms_up_pottery_sherd",
        "Sodden Birch Timber",
        "birch_planks",
        "birch_planks",
        "birch_fence",
        "birch_fence_gate",
        "birch_sign",
        "birch_slab",
        "birch_stairs",
        "birch_trapdoor",
        "birch_wall_sign",
    ),
    "jungle_timber": _wood(
        "blade_pottery_sherd",
        "Sodden Jungle Timber",
        "jungle_planks",
        "jungle_planks",
        "jungle_fence",
        "jungle_fence_gate",
        "jungle_log",
        "jungle_planks",
        "jungle_shelf",
        "jungle_slab",
        "jungle_stairs",
        "jungle_trapdoor",
        "stripped_jungle_log",
    ),
    "dark_oak_timber": _wood(
        "brewer_pottery_sherd",
        "Sodden Dark Oak Timber",
        "dark_oak_planks",
        "dark_oak_planks",
        "dark_oak_fence",
        "dark_oak_planks",
        "dark_oak_shelf",
        "dark_oak_slab",
        "dark_oak_stairs",
        "dark_oak_trapdoor",
        "dark_oak_wall_sign",
        "stripped_dark_oak_log",
    ),
    "mangrove_timber": _wood(
        "burn_pottery_sherd",
        "Sodden Mangrove Timber",
        "mangrove_planks",
        "mangrove_planks",
        "mangrove_fence",
        "mangrove_log",
        "mangrove_trapdoor",
        "mangrove_wood",
    ),
    "pale_oak_timber": _wood(
        "danger_pottery_sherd",
        "Sodden Pale Oak Timber",
        "pale_oak_planks",
        "pale_oak_planks",
        "pale_oak_fence",
        "pale_oak_fence_gate",
        "pale_oak_log",
        "pale_oak_slab",
        "pale_oak_stairs",
        "pale_oak_wood",
        "stripped_pale_oak_wood",
    ),
    "bamboo_timber": _wood(
        "explorer_pottery_sherd",
        "Sodden Bamboo Timber",
        "bamboo_planks",
        "bamboo_planks",
        "bamboo_door",
        "bamboo_trapdoor",
        "bamboo_wall_sign",
        "scaffolding",
    ),
    "acacia_timber": _wood(
        "flow_pottery_sherd",
        "Sodden Acacia Timber",
        "acacia_planks",
        "acacia_planks",
        "acacia_trapdoor",
    ),
    "cherry_timber": _wood(
        "friend_pottery_sherd",
        "Sodden Cherry Timber",
        "cherry_planks",
        "cherry_planks",
        "cherry_trapdoor",
    ),
    "crimson_timber": _wood(
        "guster_pottery_sherd",
        "Sodden Crimson Timber",
        "crimson_planks",
        "crimson_planks",
        "crimson_trapdoor",
    ),
    "warped_timber": _wood(
        "heart_pottery_sherd",
        "Sodden Warped Timber",
        "warped_planks",
        "warped_planks",
        "warped_trapdoor",
    ),
    "fiber": Material(
        base_item="heartbreak_pottery_sherd",
        display_name="Salt-Stiffened Fiber",
        item_model="string",
        station="campfire",
        recovery_outputs=(("string", 1),),
        blocks=(
            "black_bed",
            "cobweb",
            "gray_carpet",
            "light_gray_wall_banner",
            "white_carpet",
            "white_wall_banner",
            "white_wool",
        ),
    ),
    "stone": _stone(
        "howl_pottery_sherd",
        "Crusted Stone",
        "clay_ball",
        (
            ("stone", 1),
            ("cobblestone", 1),
            ("mossy_cobblestone", 1),
            ("stone_bricks", 1),
            ("mossy_stone_bricks", 1),
            ("cracked_stone_bricks", 1),
            ("stone_slab", 2),
            ("stone_stairs", 1),
            ("cobblestone_slab", 2),
            ("cobblestone_stairs", 1),
            ("cobblestone_wall", 1),
            ("mossy_cobblestone_slab", 2),
            ("mossy_cobblestone_stairs", 1),
            ("mossy_cobblestone_wall", 1),
            ("mossy_stone_brick_slab", 2),
            ("mossy_stone_brick_stairs", 1),
            ("mossy_stone_brick_wall", 1),
        ),
        "cobblestone_slab",
        "cobblestone_stairs",
        "cobblestone_wall",
        "green_terracotta",
        "grindstone",
        "lime_terracotta",
        "mossy_cobblestone",
        "mossy_cobblestone_slab",
        "mossy_cobblestone_stairs",
        "mossy_cobblestone_wall",
        "mossy_stone_brick_slab",
        "mossy_stone_brick_stairs",
        "mossy_stone_brick_wall",
        "mossy_stone_bricks",
        "piston",
        "red_concrete",
        "stone",
        "stone_button",
        "stone_slab",
        "stone_stairs",
        "white_concrete_powder",
    ),
    "andesite": _stone(
        "miner_pottery_sherd",
        "Crusted Andesite",
        "andesite",
        (
            ("andesite", 1),
            ("polished_andesite", 1),
            ("andesite_slab", 2),
            ("andesite_stairs", 1),
            ("andesite_wall", 1),
            ("polished_andesite_slab", 2),
            ("polished_andesite_stairs", 1),
        ),
        "andesite",
        "andesite_slab",
        "andesite_wall",
    ),
    "diorite": _stone(
        "mourner_pottery_sherd",
        "Crusted Diorite",
        "diorite",
        (
            ("diorite", 1),
            ("polished_diorite", 1),
            ("diorite_slab", 2),
            ("diorite_stairs", 1),
            ("diorite_wall", 1),
            ("polished_diorite_slab", 2),
            ("polished_diorite_stairs", 1),
        ),
        "diorite",
        "diorite_slab",
        "diorite_stairs",
        "diorite_wall",
    ),
    "deepslate": _stone(
        "plenty_pottery_sherd",
        "Crusted Deepslate",
        "cobbled_deepslate",
        (
            ("cobbled_deepslate", 1),
            ("polished_deepslate", 1),
            ("deepslate_bricks", 1),
            ("cracked_deepslate_bricks", 1),
            ("deepslate_tiles", 1),
            ("cracked_deepslate_tiles", 1),
            ("chiseled_deepslate", 1),
            ("cobbled_deepslate_slab", 2),
            ("cobbled_deepslate_stairs", 1),
            ("cobbled_deepslate_wall", 1),
            ("polished_deepslate_slab", 2),
            ("polished_deepslate_stairs", 1),
            ("deepslate_brick_wall", 1),
            ("deepslate_tile_slab", 2),
            ("deepslate_tile_wall", 1),
            ("polished_basalt", 1),
        ),
        "chiseled_deepslate",
        "cobbled_deepslate_slab",
        "cobbled_deepslate_stairs",
        "cobbled_deepslate_wall",
        "cracked_deepslate_tiles",
        "deepslate",
        "deepslate_brick_wall",
        "deepslate_tile_slab",
        "deepslate_tile_wall",
        "polished_basalt",
        "polished_deepslate_slab",
        "polished_deepslate_stairs",
    ),
    "sandstone": _stone(
        "prize_pottery_sherd",
        "Crusted Sandstone",
        "sandstone",
        (
            ("sandstone", 1),
            ("cut_sandstone", 1),
            ("chiseled_sandstone", 1),
            ("smooth_sandstone", 1),
            ("sandstone_slab", 2),
            ("sandstone_stairs", 1),
            ("sandstone_wall", 1),
            ("smooth_sandstone_slab", 2),
            ("smooth_sandstone_stairs", 1),
        ),
        "sandstone",
        "sandstone_slab",
        "sandstone_stairs",
        "sandstone_wall",
        "smooth_sandstone",
        "smooth_sandstone_slab",
    ),
    "brick": _stone(
        "scrape_pottery_sherd",
        "Crusted Brickwork",
        "brick",
        (
            ("bricks", 1),
            ("brick_slab", 2),
            ("brick_stairs", 1),
            ("brick_wall", 1),
        ),
        "brick_slab",
        "brick_stairs",
        "flower_pot",
    ),
    "mud_brick": _stone(
        "sheaf_pottery_sherd",
        "Crusted Mud Brick",
        "mud_bricks",
        (
            ("mud_bricks", 1),
            ("mud_brick_slab", 2),
            ("mud_brick_stairs", 1),
            ("mud_brick_wall", 1),
        ),
        "mud_brick_slab",
        "mud_brick_wall",
        "mud_bricks",
    ),
    "tuff": _stone(
        "shelter_pottery_sherd",
        "Crusted Tuff",
        "tuff",
        (
            ("tuff", 1),
            ("polished_tuff", 1),
            ("tuff_bricks", 1),
            ("tuff_slab", 2),
            ("tuff_stairs", 1),
            ("tuff_wall", 1),
            ("polished_tuff_slab", 2),
            ("polished_tuff_stairs", 1),
            ("polished_tuff_wall", 1),
            ("tuff_brick_slab", 2),
            ("tuff_brick_stairs", 1),
            ("tuff_brick_wall", 1),
        ),
        "polished_tuff_wall",
        "tuff_brick_wall",
        "tuff_wall",
    ),
    "quartz": _stone(
        "skull_pottery_sherd",
        "Crusted Quartz",
        "quartz",
        (
            ("quartz_block", 1),
            ("quartz_bricks", 1),
            ("chiseled_quartz_block", 1),
            ("quartz_pillar", 1),
            ("smooth_quartz", 1),
            ("quartz_slab", 2),
            ("quartz_stairs", 1),
            ("smooth_quartz_slab", 2),
            ("smooth_quartz_stairs", 1),
        ),
        "quartz_block",
        "smooth_quartz",
        "smooth_quartz_slab",
        "smooth_quartz_stairs",
    ),
    "prismarine": _stone(
        "snort_pottery_sherd",
        "Crusted Prismarine",
        "prismarine_shard",
        (
            ("prismarine", 1),
            ("prismarine_bricks", 1),
            ("dark_prismarine", 1),
            ("prismarine_slab", 2),
            ("prismarine_stairs", 1),
            ("prismarine_wall", 1),
            ("prismarine_brick_slab", 2),
            ("prismarine_brick_stairs", 1),
            ("dark_prismarine_slab", 2),
            ("dark_prismarine_stairs", 1),
        ),
        "prismarine_slab",
    ),
    "nether_brick": _stone(
        "knowledge_book",
        "Crusted Nether Brick",
        "nether_brick",
        (
            ("nether_bricks", 1),
            ("red_nether_bricks", 1),
            ("cracked_nether_bricks", 1),
            ("chiseled_nether_bricks", 1),
            ("nether_brick_slab", 2),
            ("nether_brick_stairs", 1),
            ("nether_brick_wall", 1),
            ("red_nether_brick_slab", 2),
            ("red_nether_brick_stairs", 1),
            ("red_nether_brick_wall", 1),
        ),
        "red_nether_brick_wall",
    ),
    "obsidian": _stone(
        "debug_stick",
        "Crusted Obsidian",
        "obsidian",
        (("obsidian", 1),),
        "obsidian",
    ),
    "copper": Material(
        base_item="command_block_minecart",
        display_name="Corroded Copper Chunk",
        item_model="raw_copper",
        station="blast_furnace",
        recovery_outputs=(("copper_ingot", 1),),
        blocks=(
            "bell",
            "waxed_exposed_copper",
            "waxed_exposed_copper_bars",
            "waxed_exposed_copper_bulb",
            "waxed_exposed_copper_chain",
            "waxed_exposed_copper_grate",
            "waxed_exposed_copper_lantern",
            "waxed_exposed_cut_copper_stairs",
            "waxed_oxidized_copper_bars",
            "waxed_oxidized_copper_grate",
            "waxed_oxidized_copper_trapdoor",
            "waxed_oxidized_cut_copper",
            "waxed_oxidized_cut_copper_slab",
            "waxed_weathered_copper",
            "waxed_weathered_copper_grate",
            "waxed_weathered_copper_trapdoor",
            "waxed_weathered_cut_copper",
            "waxed_weathered_cut_copper_slab",
        ),
    ),
    "iron": Material(
        base_item="disc_fragment_5",
        display_name="Corroded Iron Scrap",
        item_model="iron_nugget",
        station="blast_furnace",
        recovery_outputs=(("iron_ingot", 1),),
        blocks=(
            "anvil",
            "heavy_weighted_pressure_plate",
            "iron_bars",
            "iron_chain",
            "iron_door",
            "iron_trapdoor",
            "lodestone",
            "rail",
            "tripwire_hook",
        ),
    ),
}


INTACT_ITEM_OVERRIDES = {
    "bamboo_wall_sign": "bamboo_sign",
    "birch_wall_sign": "birch_sign",
    "dark_oak_wall_sign": "dark_oak_sign",
    "light_gray_wall_banner": "light_gray_banner",
    "oak_wall_sign": "oak_sign",
    "spruce_wall_sign": "spruce_sign",
    "white_wall_banner": "white_banner",
}

# These blocks share vanilla loot-table ids with their standing variants.
LOOT_TABLE_OVERRIDES = dict(INTACT_ITEM_OVERRIDES)


DOOR_BLOCKS = {block for material in MATERIALS.values() for block in material.blocks if block.endswith("_door")}
BED_BLOCKS = {"black_bed"}
SLAB_BLOCKS = {block for material in MATERIALS.values() for block in material.blocks if block.endswith("_slab")}

DEFAULT_UNLOCK_SPEEDS = {
    1: 12.0,
    2: 14.0,
    3: 8.0,
    4: 9.0,
    5: 10.0,
    6: 10.0,
    7: 12.0,
    8: 14.0,
    9: 16.0,
    10: 20.0,
}


def block_materials() -> dict[str, str]:
    result: dict[str, str] = {}
    for material_id, material in MATERIALS.items():
        for block in material.blocks:
            if block in result:
                raise ValueError(f"{block} is assigned to both {result[block]} and {material_id}")
            result[block] = material_id
    return result


def hardness_tier(block: str, material_id: str) -> int:
    if block in {
        "black_bed",
        "gray_carpet",
        "light_gray_wall_banner",
        "redstone_torch",
        "white_carpet",
        "white_wall_banner",
        "white_wool",
    }:
        return 1
    if block in {
        "cobweb",
        "flower_pot",
        "ladder",
        "scaffolding",
        "stone_button",
        "white_concrete_powder",
    } or block.endswith(("_sign", "_wall_sign")):
        return 2
    if material_id.endswith("_timber") and block.endswith(("_fence", "_fence_gate", "_slab")):
        return 3
    if material_id.endswith("_timber") and block.endswith(
        ("_door", "_planks", "_shelf", "_stairs", "_trapdoor")
    ):
        return 4
    if (
        material_id.endswith("_timber")
        or material_id == "sandstone"
        or block in {"green_terracotta", "lime_terracotta", "red_concrete"}
    ):
        return 5
    if block in {"bell", "iron_door", "iron_trapdoor", "piston"}:
        return 8
    if material_id in {
        "stone",
        "andesite",
        "diorite",
        "brick",
        "mud_brick",
        "tuff",
        "quartz",
        "prismarine",
        "nether_brick",
    }:
        return 6
    if material_id == "copper" or block in {
        "heavy_weighted_pressure_plate",
        "iron_bars",
        "iron_chain",
        "rail",
        "tripwire_hook",
    }:
        return 7
    if material_id == "deepslate" or block == "anvil":
        return 9
    if material_id == "obsidian" or block == "lodestone":
        return 10
    raise ValueError(f"No hardness tier for {block} ({material_id})")


def unlock_speed(block: str, tier: int) -> float:
    if block in {"gray_carpet", "white_carpet"}:
        return 10.0
    if block == "black_bed":
        return 12.0
    if block == "white_wool":
        return 14.0
    if block.endswith("_wall_banner"):
        return 14.0
    if block == "cobweb":
        return 16.0
    if block == "ladder":
        return 12.0
    if block.endswith(("_sign", "_wall_sign")):
        return 14.0
    if block == "white_concrete_powder":
        return 12.0
    if block == "obsidian":
        return 20.0
    if block == "lodestone":
        return 14.0
    return DEFAULT_UNLOCK_SPEEDS[tier]


def salvage_units(block: str, material_id: str) -> float:
    special = {
        "anvil": 31.0,
        "beehive": 6.0,
        "bell": 4.0,
        "black_bed": 12.0,
        "campfire": 4.0,
        "cobweb": 4.0,
        "composter": 3.5,
        "flower_pot": 0.75,
        "gray_carpet": 8.0 / 3.0,
        "heavy_weighted_pressure_plate": 2.0,
        "iron_bars": 1.0,
        "iron_chain": 1.0,
        "iron_door": 2.0,
        "iron_trapdoor": 4.0,
        "light_gray_wall_banner": 24.0,
        "lodestone": 1.0,
        "note_block": 8.0,
        "piston": 1.0,
        "rail": 6.0 / 16.0,
        "redstone_torch": 0.125,
        "scaffolding": 1.0,
        "tripwire_hook": 0.5,
        "white_carpet": 8.0 / 3.0,
        "white_wall_banner": 24.0,
        "white_wool": 4.0,
    }
    if block in special:
        return special[block]
    if material_id.endswith("_timber"):
        if block.endswith(("_log", "_wood")):
            return 4.0
        if block.endswith("_slab"):
            return 0.5
        if block.endswith("_stairs"):
            return 1.0
        if block.endswith("_fence"):
            return 1.5
        if block.endswith("_fence_gate"):
            return 2.0
        if block.endswith(("_sign", "_wall_sign")):
            return 2.0
        if block.endswith("_door"):
            return 2.0
        if block.endswith("_trapdoor"):
            return 3.0
        if block.endswith("_shelf"):
            return 4.0
        return 1.0
    if material_id == "copper":
        if block.endswith("_slab"):
            return 4.5
        if block.endswith("_stairs"):
            return 9.0
        if block.endswith("_bars"):
            return 6.0 / 16.0
        if block.endswith("_chain"):
            return 1.0
        if block.endswith("_bulb"):
            return 6.75
        if block.endswith("_grate") or block in {"waxed_exposed_copper", "waxed_weathered_copper"}:
            return 9.0
        if block.endswith("_lantern"):
            return 1.0
        if block.endswith("_trapdoor"):
            return 4.0
        if "cut_copper" in block:
            return 9.0
        return 1.0
    if block.endswith("_slab"):
        return 0.5
    return 1.0


BLOCK_MATERIALS = block_materials()
