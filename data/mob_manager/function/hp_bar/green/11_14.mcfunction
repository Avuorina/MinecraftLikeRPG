#> mob_manager:hp_bar/green/10_14
#
# HPバー更新（マクロ版）
#
# @within bank_manager:mob/hurt/hit

## 11-12
    execute if score @s HPRatio matches 11..12 run function mob_manager:hp_bar/green/1112 with storage bank:mob

## 13-14
    execute if score @s HPRatio matches 13..14 run function mob_manager:hp_bar/green/1314 with storage bank:mob