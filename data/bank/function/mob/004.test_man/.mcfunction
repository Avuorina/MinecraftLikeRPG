# テストマン - Tick Function
# 初期化チェック
execute if entity @s[tag=Init] run function bank:mob/004.test_man/init
execute if entity @s[tag=Init] run tag @s remove Init


# ここにインターバル/ターン制スキルを追加可能
