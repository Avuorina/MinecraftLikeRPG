#> mob_manager:hp_bar/green/15_20
#
# HPバー更新（マクロ版）
#
# @within mob_manager:hp_bar/green/10_

## 15-16
    execute if score @s HPRatio matches 15..16 run function mob_manager:hp_bar/green/1516 with storage bank:mob

## 17-18
    execute if score @s HPRatio matches 17..18 run function mob_manager:hp_bar/green/1718 with storage bank:mob

## 19-20
    execute if score @s HPRatio matches 19..20 run function mob_manager:hp_bar/green/1920 with storage bank:mob