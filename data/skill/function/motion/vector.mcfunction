#> skill:motion/vector


#> skill:motion/vector

# マーカーを向いている方向に1ブロック進める（単位ベクトル作成）
    execute as @e[type=marker,tag=motion_calc,limit=1] at @s run tp @s ^ ^ ^1

# Speed取得 (scale: 100)
    execute store result score #speed _ run data get storage skill: data.Speed 100

# SpeedRangeがある場合、揺らぎを加算
    execute if data storage skill: data.SpeedRange run function skill:motion/calc_range

# 各軸の座標（＝ベクトル成分）を取得してSpeed倍する
# Pos(100) * Speed(100) = 10000 -> store double 0.0001 = 1.0

# X
    execute store result score #calc _ run data get entity @e[type=marker,tag=motion_calc,limit=1] Pos[0] 100
    scoreboard players operation #calc _ *= #speed _
    execute store result entity @e[type=marker,tag=motion_calc,limit=1] Pos[0] double 0.0001 run scoreboard players get #calc _

# Y
    execute store result score #calc _ run data get entity @e[type=marker,tag=motion_calc,limit=1] Pos[1] 100
    scoreboard players operation #calc _ *= #speed _
    execute store result entity @e[type=marker,tag=motion_calc,limit=1] Pos[1] double 0.0001 run scoreboard players get #calc _

# Z
    execute store result score #calc _ run data get entity @e[type=marker,tag=motion_calc,limit=1] Pos[2] 100
    scoreboard players operation #calc _ *= #speed _
    execute store result entity @e[type=marker,tag=motion_calc,limit=1] Pos[2] double 0.0001 run scoreboard players get #calc _

# Apply to entity
    data modify entity @s Motion set from entity @e[type=marker,tag=motion_calc,limit=1] Pos
