#> bank:mob/4.test_man/
# テストマン - Tick Function
# @within mob_manager:tick (execute as @e[tag=4.test_man])
# 初期化チェック
execute if entity @s[tag=Init] run tag @s remove Init


# ここにインターバル/ターン制スキルを追加可能
