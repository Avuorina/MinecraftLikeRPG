#> mob_manager:hp_bar/yellow/910
#
#
#
# @within bank_manager:mob/hurt/hit

## 9
    $execute if score @s HPRatio matches 9 run data modify entity @s text set value [$(Name),{"text":"\nHP: $(HP) / $(MaxHP)\n","color":"white"},{"text":"████","color":"yellow"},{"text":"▌","color":"yellow"},{"text":"▌","color":"dark_gray"},{"text":"█████","color":"dark_gray"}]

## 10
    $execute if score @s HPRatio matches 10 run data modify entity @s text set value [$(Name),{"text":"\nHP: $(HP) / $(MaxHP)\n","color":"white"},{"text":"█████","color":"yellow"},{"text":"█████","color":"dark_gray"}]