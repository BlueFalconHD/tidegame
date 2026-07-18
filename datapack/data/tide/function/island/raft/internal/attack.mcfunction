# Interaction entities record the attacking player in `attack` data and expose
# that player through the `attacker` execute relation.
execute on attacker at @s run function tide:island/raft/internal/try_pickup
data remove entity @s attack
