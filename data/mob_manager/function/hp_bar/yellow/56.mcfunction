#> mob_manager:hp_bar/yellow/56
#
#
#
# @within bank_manager:mob/hurt/hit

## 5
    $execute if score @s HPRatio matches 5 run data modify entity @s text set value [$(Name),{"text":"\nHP: $(HP) / $(MaxHP)\n","color":"white"},{"text":"██","color":"yellow"},{"text":"▌","color":"yellow"},{"text":"▌","color":"dark_gray"},{"text":"███████","color":"dark_gray"}]

## 6
    $execute if score @s HPRatio matches 6 run data modify entity @s text set value [$(Name),{"text":"\nHP: $(HP) / $(MaxHP)\n","color":"white"},{"text":"███","color":"yellow"},{"text":"███████","color":"dark_gray"}]