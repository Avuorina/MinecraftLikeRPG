#> skill:summon/apply_spread_calc
#
# ランダムな角度(0-360)と距離(0-Spread)を計算してtp

# 1. ランダム角度 (0-359)
    execute store result score #angle _ run random value 0..359
    execute store result storage skill: temp.Angle float 1.0 run scoreboard players get #angle _

# 2. ランダム距離 (0 - Spread)
# Spread * (Random(0..100) / 100)
    execute store result score #current_spread _ run scoreboard players get #spread _
    execute store result score #rand _ run random value 0..100

scoreboard players operation #current_spread _ *= #rand _
scoreboard players operation #current_spread _ /= $100 Const

# score -> storage
    execute store result storage skill: temp.Spread double 0.01 run scoreboard players get #current_spread _

# tp実行
    function skill:summon/apply_spread_tp with storage skill: temp
