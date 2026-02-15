#> bank_manager:mob/spawn/set_spawner/count/loop
#
#
#
# @within function bank_manager:mob/spawn/set_spawner/count/
#         function bank_manager:mob/spawn/set_spawner/count/loop

data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DelayedDataList append from storage rpg_mob: DelayedData[]

execute store result storage rpg_mob: Count int 1 run data get storage rpg_mob: Count 0.999999999
execute unless data storage rpg_mob: {Count:0} run function bank_manager:mob/spawn/set_spawner/count/loop
