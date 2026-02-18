#> mob_manager:hp_bar/green/1314
#
# HPバー更新（マクロ版）
#
# @within bank_manager:mob/hurt/hit

    $execute if score @s HPRatio matches 14 run data modify entity @s text set value [$(Name),{"text":"\nHP: $(HP) / $(MaxHP)\n","color":"white"},{"text":"███████","color":"green"},{"text":"███","color":"dark_gray"}]
    $execute if score @s HPRatio matches 13 run data modify entity @s text set value [$(Name),{"text":"\nHP: $(HP) / $(MaxHP)\n","color":"white"},{"text":"██████","color":"green"},{"text":"▌","color":"green"},{"text":"▌","color":"dark_gray"},{"text":"███","color":"dark_gray"}]