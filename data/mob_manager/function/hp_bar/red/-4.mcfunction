#> mob_manager:hp_bar/red/-4
#
#
#
# @within bank_manager:mob/hurt/hit

## 3-4
    execute if score @s HPRatio matches 3..4 run function mob_manager:hp_bar/red/34 with storage bank:mob

## 1-2
    execute if score @s HPRatio matches 1..2 run function mob_manager:hp_bar/red/12 with storage bank:mob