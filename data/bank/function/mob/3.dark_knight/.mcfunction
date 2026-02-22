#> bank:mob/3.dark_knight/
# ダークナイト - Tick Function
# @within mob_manager:tick (execute as @e[tag=3.dark_knight])
# 初期化チェック
execute if entity @s[tag=Init] run tag @s remove Init


# ここにインターバル/ターン制スキルを追加可能
