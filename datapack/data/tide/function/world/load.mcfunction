# tide.location values:
# 0: outside a Tide gameplay area
# 1: open ocean
# 2: generated player island
scoreboard objectives add tide.location dummy
scoreboard objectives add tide.location.island dummy
scoreboard objectives add tide.location.tmp dummy

# Legacy transition state used by the ocean bounds check.
scoreboard objectives add tide.area_transition dummy area_transition
