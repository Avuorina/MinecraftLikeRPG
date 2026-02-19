#> mob_manager:hp_bar/yellow/78
#
#
#
# @within mob_manager:hp_bar/yellow/5_8

## 7
    $execute if score @s HPRatio matches 7 run data modify entity @s text set value [$(Name),{"text":"\nHP: $(HP) / $(MaxHP)\n","color":"white"},{"text":"███","color":"yellow"},{"text":"▌","color":"yellow"},{"text":"▌","color":"dark_gray"},{"text":"██████","color":"dark_gray"}]

## 8
    $execute if score @s HPRatio matches 8 run data modify entity @s text set value [$(Name),{"text":"\nHP: $(HP) / $(MaxHP)\n","color":"white"},{"text":"████","color":"yellow"},{"text":"██████","color":"dark_gray"}]