#> mob_manager:hp_bar/green/1920
#
# HPバー更新（マクロ版）
#
# @within bank_manager:mob/hurt/hit

    $execute if score @s HPRatio matches 20 run data modify entity @s text set value [$(Name),{"text":"\nHP: $(HP) / $(MaxHP)\n","color":"white"},{"text":"██████████","color":"green"}]
    $execute if score @s HPRatio matches 19 run data modify entity @s text set value [$(Name),{"text":"\nHP: $(HP) / $(MaxHP)\n","color":"white"},{"text":"█████████","color":"green"},{"text":"▌","color":"green"},{"text":"▌","color":"dark_gray"}]
