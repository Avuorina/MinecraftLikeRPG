#> mob_manager:hp_bar/green/10_
#
# HPバー更新（マクロ版）
#
# @within mob_manager:hp_bar/apply_text

## 15-20
    execute if score @s HPRatio matches 15..20 run function mob_manager:hp_bar/green/15_20

## 10-14
    execute if score @s HPRatio matches 10..14 run function mob_manager:hp_bar/green/11_14
