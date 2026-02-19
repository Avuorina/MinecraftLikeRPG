#> mob_manager:hp_bar/red/12
#
# HPバー更新（マクロ版）
# @within mob_manager:hp_bar/red/-4

## 1
    $execute if score @s HPRatio matches 1 run data modify entity @s text set value [$(Name),{"text":"\nHP: $(HP) / $(MaxHP)\n","color":"white"},{"text":"▌","color":"red"},{"text":"▌","color":"dark_gray"},{"text":"█████████","color":"dark_gray"}]

## 2
    $execute if score @s HPRatio matches 2 run data modify entity @s text set value [$(Name),{"text":"\nHP: $(HP) / $(MaxHP)\n","color":"white"},{"text":"█","color":"red"},{"text":"█████████","color":"dark_gray"}]

