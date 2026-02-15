#> bank_manager:mob/spawn/set_spawner/count/
#
# rpg_mob.Count分だけ、モブをスポーンする
#
# @within function bank_manager:mob/spawn/

data modify storage rpg_mob: DelayedData set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DelayedDataList

execute store result storage rpg_mob: Count int 1 run data get storage rpg_mob: Count 0.999999999
execute unless data storage rpg_mob: {Count:0} run function bank_manager:mob/spawn/set_spawner/count/loop
