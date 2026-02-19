#> mob_manager:hp_bar/yellow/4_
#
# HPバー更新（マクロ版）
#
# @within mob_manager:hp_bar/apply_text

## 910
    execute if score @s HPRatio matches 9..10 run function mob_manager:hp_bar/yellow/910 with storage bank:mob

## 5-8
    execute if score @s HPRatio matches 5..8 run function mob_manager:hp_bar/yellow/5_8
