#> mob:status/str.atk/update
#
# 攻撃力計算式
#
# @public

# 持っている武器を取得してみる
    execute store result score @s WeaponATK run attribute @s minecraft:attack_damage get

# STR補正計算
# A項: STR / 5   ( $X )
    scoreboard players operation $X _ = @s STR
    scoreboard players operation $X _ /= $5 Const

# B項: Base * (1 + STR/100) = Base * (100 + STR) / 100
# 100 + STR を $Y に計算
    scoreboard players operation $Y _ = @s STR
    scoreboard players operation $Y _ += $100 Const
    
# Base * $Y
    scoreboard players operation @s WeaponATK *= $Y _

# 結果 / 100
    scoreboard players operation @s WeaponATK /= $100 Const

# 合算 (A項 + B項)
    scoreboard players operation @s WeaponATK += $X _

# 最終値をATKにコピー
    scoreboard players operation @s ATK = @s WeaponATK

# RESET
    scoreboard players reset @s _
    scoreboard players reset @s WeaponATK
    scoreboard players reset $X _
    scoreboard players reset $Y _
