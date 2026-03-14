#> bank:mob/10.desert_raider/
# 砂漠のレイダー - Tick Function
# @within mob_manager:tick (execute as @e[tag=10.desert_raider])
# 初期化チェック
execute if entity @s[tag=Init] run tag @s remove Init


# ここにインターバル/ターン制スキルを追加可能
