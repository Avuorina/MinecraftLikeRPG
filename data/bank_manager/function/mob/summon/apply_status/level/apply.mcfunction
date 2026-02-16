#> bank_manager:mob/summon/apply_status/level/apply
#
#
#
# @within function bank_manager:mob/summon/apply_status/level/

# 適用
    $data modify entity @s CustomName set value [$(CustomName),$(LV_js)]

# RESET
    data remove storage bank:mob LV_js
    data remove storage bank:mob lv