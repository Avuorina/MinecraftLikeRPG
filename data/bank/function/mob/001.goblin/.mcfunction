#> bank:mob/001.goblin/
# テストゴブリン - Tick Function
# @within mob_manager:tick (execute as @e[tag=001.goblin])
# 初期化チェック
execute if entity @s[tag=Init] run tag @s remove Init


# ここにインターバル/ターン制スキルを追加可能
