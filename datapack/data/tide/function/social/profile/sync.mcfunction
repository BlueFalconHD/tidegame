data modify storage tide:social scratch.profile set value {name:"Unknown Player"}
execute store result storage tide:social scratch.profile.id int 1 run scoreboard players get @s tide.identifier.player
data modify storage tide:social scratch.profile.name set from entity @s bukkit.lastKnownName
function tide:social/profile/upsert with storage tide:social scratch.profile
