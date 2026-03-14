#> bank:mob/9.plains_raider/
# 平原のレイダー - Tick Function
# @within mob_manager:tick (execute as @e[tag=9.plains_raider])
# 初期化チェック
execute if entity @s[tag=Init] run tag @s remove Init


# ここにインターバル/ターン制スキルを追加可能
