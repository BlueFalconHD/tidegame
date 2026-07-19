execute if score #broken_class tide.salvage.tmp matches 1 run playsound minecraft:block.wood.break block @a[distance=..16] ~0.5 ~0.5 ~0.5 0.8 1.4
execute if score #broken_class tide.salvage.tmp matches 2 run playsound minecraft:block.copper.break block @a[distance=..16] ~0.5 ~0.5 ~0.5 0.8 1.0
execute if score #broken_class tide.salvage.tmp matches 3 run playsound minecraft:block.anvil.break block @a[distance=..16] ~0.5 ~0.5 ~0.5 0.8 0.7

execute if score #broken_class tide.salvage.tmp matches 0 if score #failed_class tide.salvage.tmp matches 2 run playsound minecraft:block.copper.hit block @a[distance=..16] ~0.5 ~0.5 ~0.5 0.4 0.8
execute if score #broken_class tide.salvage.tmp matches 0 if score #failed_class tide.salvage.tmp matches 3 run playsound minecraft:block.anvil.hit block @a[distance=..16] ~0.5 ~0.5 ~0.5 0.45 0.65
execute if score #broken_class tide.salvage.tmp matches 0 if score #failed_class tide.salvage.tmp matches 2.. run playsound minecraft:block.chain.hit block @a[distance=..16] ~0.5 ~0.5 ~0.5 0.35 0.6
execute if score #broken_class tide.salvage.tmp matches 0 if score #failed_class tide.salvage.tmp matches 0 run playsound minecraft:block.stone.hit block @a[distance=..16] ~0.5 ~0.5 ~0.5 0.35 0.6
