
#> skill:summon/apply_spread
#
# Spread適用
# ランダムな角度(0-360)と距離(0-Spread)を計算してtp

# 1. ランダム角度 (0-359)
    execute store result score #angle _ run random value 0..359
    execute as @e[type=marker,tag=SummonPos,limit=1,sort=nearest] store result entity @s Rotation[0] float 1.0 run scoreboard players get #angle _

# 2. ランダム距離 (0 - Spread)
# Spread * (Random(0..100) / 100)
    execute store result score #spread _ run data get storage skill: data.Spread 100
    execute store result score #rand _ run random value 0..100

scoreboard players operation #spread _ *= #rand _
scoreboard players operation #spread _ /= $100 Const

# マーカーを前進

# score -> storage
    execute store result storage skill: temp.Spread double 0.01 run scoreboard players get #spread _

function skill:summon/apply_spread_tp with storage skill: temp

