#> bank_manager:mob/spawn/apply_status/level/
#
#
#
# @within function bank_manager:mob/spawn/apply_status/from_storage

# LV表示
    $data modify storage rpg_mob: Delay.Status.LV_js set value {"text":" Lv.$(Level)","color":"gray","bold":false}

# マクロ呼びだし
    function bank_manager:mob/spawn/apply_status/level/apply with storage rpg_mob: Delay.Status