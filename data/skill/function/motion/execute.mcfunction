#> skill:motion/execute

# 計算用マーカーを召喚（存在しなければ）
    execute unless entity @e[type=marker,tag=motion_calc,limit=1] run summon marker 0 0 0 {Tags:["motion_calc"],UUID:[I;0,0,0,0]}

# 計算用マーカーを原点に移動
    tp @e[type=marker,tag=motion_calc,limit=1] 0.0 0.0 0.0

# 実行者の向きを基準にする場合（Relative）は、マーカーを実行者と同じ向きにする
# Default is relative to mob's looking direction
# JSON: {Absolute:1b} to use absolute rotation
    execute as @e[type=marker,tag=motion_calc,limit=1] run data modify entity @s Rotation set from entity @p Rotation

# Directionパラメータがある場合、回転を加算/設定
    execute if data storage skill: data.Direction run function skill:motion/direction

# ベクトル計算と適用
    function skill:motion/vector
