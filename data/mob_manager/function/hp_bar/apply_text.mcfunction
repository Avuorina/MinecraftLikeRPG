#> mob_manager:hp_bar/apply_text
#
# テキスト適用（マクロ）
# $(HP), $(MaxHP), $(HPRatio) を受け取る
# 実行者(@s)はMOB

# text_displayを直接指定して更新 (@e[distance=..1])
# on passengers はタイミングによっては不安定なため使用しない

execute store result score @s HPRatio run data get storage bank:mob HPRatio

# Green (>10)
    execute if score @s HPRatio matches 11..20 run function mob_manager:hp_bar/green/10_

# Yellow (>4)
    execute if score @s HPRatio matches 5..10 run function mob_manager:hp_bar/yellow/4_
    #$execute if data storage bank:mob {HPRatio:10} run data modify entity @s text set value [$(Name),{"text":"\nHP: $(HP) / $(MaxHP)\n","color":"white"},{"text":"█████","color":"yellow"},{"text":"█████","color":"dark_gray"}]
    #$execute if data storage bank:mob {HPRatio:9} run data modify entity @s text set value [$(Name),{"text":"\nHP: $(HP) / $(MaxHP)\n","color":"white"},{"text":"████","color":"yellow"},{"text":"▌","color":"yellow"},{"text":"▌","color":"dark_gray"},{"text":"█████","color":"dark_gray"}]
    #$execute if data storage bank:mob {HPRatio:8} run data modify entity @s text set value [$(Name),{"text":"\nHP: $(HP) / $(MaxHP)\n","color":"white"},{"text":"████","color":"yellow"},{"text":"██████","color":"dark_gray"}]
    #$execute if data storage bank:mob {HPRatio:7} run data modify entity @s text set value [$(Name),{"text":"\nHP: $(HP) / $(MaxHP)\n","color":"white"},{"text":"███","color":"yellow"},{"text":"▌","color":"yellow"},{"text":"▌","color":"dark_gray"},{"text":"██████","color":"dark_gray"}]
    #$execute if data storage bank:mob {HPRatio:6} run data modify entity @s text set value [$(Name),{"text":"\nHP: $(HP) / $(MaxHP)\n","color":"white"},{"text":"███","color":"yellow"},{"text":"███████","color":"dark_gray"}]
    #$execute if data storage bank:mob {HPRatio:5} run data modify entity @s text set value [$(Name),{"text":"\nHP: $(HP) / $(MaxHP)\n","color":"white"},{"text":"██","color":"yellow"},{"text":"▌","color":"yellow"},{"text":"▌","color":"dark_gray"},{"text":"███████","color":"dark_gray"}]

# Red (<=4)
    execute if score @s HPRatio matches 1..4 run function mob_manager:hp_bar/red/-4
    #$execute if data storage bank:mob {HPRatio:4} run data modify entity @s text set value [$(Name),{"text":"\nHP: $(HP) / $(MaxHP)\n","color":"white"},{"text":"██","color":"red"},{"text":"████████","color":"dark_gray"}]
    #$execute if data storage bank:mob {HPRatio:3} run data modify entity @s text set value [$(Name),{"text":"\nHP: $(HP) / $(MaxHP)\n","color":"white"},{"text":"█","color":"red"},{"text":"▌","color":"red"},{"text":"▌","color":"dark_gray"},{"text":"████████","color":"dark_gray"}]
    #$execute if data storage bank:mob {HPRatio:2} run data modify entity @s text set value [$(Name),{"text":"\nHP: $(HP) / $(MaxHP)\n","color":"white"},{"text":"█","color":"red"},{"text":"█████████","color":"dark_gray"}]
    #$execute if data storage bank:mob {HPRatio:1} run data modify entity @s text set value [$(Name),{"text":"\nHP: $(HP) / $(MaxHP)\n","color":"white"},{"text":"▌","color":"red"},{"text":"▌","color":"dark_gray"},{"text":"█████████","color":"dark_gray"}]
    # 0以下
        execute if score @s HPRatio matches 0 run data modify entity @s text set value [{"text":"DEAD","color":"red"}]
