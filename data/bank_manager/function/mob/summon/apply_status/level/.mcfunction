#> bank_manager:mob/summon/apply_status/level/
#
#
#
# @within function bank_manager:mob/summon/apply_status/from_storage

# LV表示
    $data modify storage bank:mob LV_js set value {"text":" Lv.$(lv)","color":"gray","bold":false}

# マクロ呼びだし
    function bank_manager:mob/summon/apply_status/level/apply with storage bank:mob