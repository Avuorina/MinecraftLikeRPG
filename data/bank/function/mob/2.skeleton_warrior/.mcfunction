#> bank:mob/2.skeleton_warrior/
# スケルトン戦士 - Tick Function
# @within mob_manager:tick (execute as @e[tag=2.skeleton_warrior])
# 初期化チェック
execute if entity @s[tag=Init] run tag @s remove Init


# ここにインターバル/ターン制スキルを追加可能
