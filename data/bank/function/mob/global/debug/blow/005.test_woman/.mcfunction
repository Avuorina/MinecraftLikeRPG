# テストウーマン - Tick Function
# 初期化チェック
execute if entity @s[tag=Init] run function bank:mob/global/debug/blow/005.test_woman/init
execute if entity @s[tag=Init] run tag @s remove Init


# ここにインターバル/ターン制スキルを追加可能
