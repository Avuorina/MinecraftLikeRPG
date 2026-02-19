#> mob_manager:hp_bar/green/1516
#
# HPバー更新（マクロ版）
#
# @within mob_manager:hp_bar/green/15_20

    $execute if score @s HPRatio matches 16 run data modify entity @s text set value [$(Name),{"text":"\nHP: $(HP) / $(MaxHP)\n","color":"white"},{"text":"████████","color":"green"},{"text":"██","color":"dark_gray"}]
    $execute if score @s HPRatio matches 15 run data modify entity @s text set value [$(Name),{"text":"\nHP: $(HP) / $(MaxHP)\n","color":"white"},{"text":"███████","color":"green"},{"text":"▌","color":"green"},{"text":"▌","color":"dark_gray"},{"text":"██","color":"dark_gray"}]