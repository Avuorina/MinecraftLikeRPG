#> mob_manager:hp_bar/red/34
#
# HPバー更新（マクロ版）
# @within mob_manager:hp_bar/red/-4

## 3
    $execute if score @s HPRatio matches 3 run data modify entity @s text set value [$(Name),{"text":"\nHP: $(HP) / $(MaxHP)\n","color":"white"},{"text":"█","color":"red"},{"text":"▌","color":"red"},{"text":"▌","color":"dark_gray"},{"text":"████████","color":"dark_gray"}]

## 4
    $execute if score @s HPRatio matches 4 run data modify entity @s text set value [$(Name),{"text":"\nHP: $(HP) / $(MaxHP)\n","color":"white"},{"text":"██","color":"red"},{"text":"████████","color":"dark_gray"}]