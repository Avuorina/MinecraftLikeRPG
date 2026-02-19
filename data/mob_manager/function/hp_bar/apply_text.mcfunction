#> mob_manager:hp_bar/apply_text
#
# テキスト適用（マクロ）
# $(HP), $(MaxHP), $(HPRatio) を受け取る
# 実行者(@s)はMOB
# @within mob_manager:hp_bar/update

execute store result score @s HPRatio run data get storage bank:mob HPRatio

# Green (>10)
    execute if score @s HPRatio matches 11..20 run function mob_manager:hp_bar/green/10_

# Yellow (>4)
    execute if score @s HPRatio matches 5..10 run function mob_manager:hp_bar/yellow/4_

# Red (<=4)
    execute if score @s HPRatio matches 1..4 run function mob_manager:hp_bar/red/-4

# 0以下
    execute if score @s HPRatio matches 0 run data modify entity @s text set value [{"text":"DEAD","color":"red"}]
