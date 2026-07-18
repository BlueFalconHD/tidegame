data modify storage tide:social scratch.request set value {}
execute store result storage tide:social scratch.request.from int 1 run scoreboard players get #social_source tide.social.tmp
execute store result storage tide:social scratch.request.to int 1 run scoreboard players get #social_target tide.social.tmp

data modify storage tide:social scratch.reverse_request set value {}
execute store result storage tide:social scratch.reverse_request.from int 1 run scoreboard players get #social_target tide.social.tmp
execute store result storage tide:social scratch.reverse_request.to int 1 run scoreboard players get #social_source tide.social.tmp
