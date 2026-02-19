
#> skill:motion/calc_range

# SpeedRangeによる速度の揺らぎを計算
# @s Random (0..99) を使用して -Range ～ +Range の値を算出

# 1. Range取得 (scale: 100)
# 例: SpeedRange:0.2 -> 20
    execute store result score #range _ run data get storage skill: data.SpeedRange 100

# 2. ランダム値取得 (0..99)
    function lib:calc/random100

# 3. 中心を0にずらす (-50 .. 49)
    scoreboard players remove @s Random 50

# 4. 変動値を計算: (Random - 50) * Range / 50
    scoreboard players operation #val _ = @s Random
    scoreboard players operation #val _ *= #range _

# $50 Const があるか確認、なければ生成 or 固定値
# ここでは安全のため固定値50を作る
    scoreboard players operation #val _ /= $50 Const

# 5. Speedに加算
    scoreboard players operation #speed _ += #val _
