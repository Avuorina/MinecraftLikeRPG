#> bank:mob/5.test_woman/
# テストウーマン - Tick Function
# @within mob_manager:tick (execute as @e[tag=5.test_woman])
# 初期化チェック
execute if entity @s[tag=Init] run tag @s remove Init


# ここにインターバル/ターン制スキルを追加可能
