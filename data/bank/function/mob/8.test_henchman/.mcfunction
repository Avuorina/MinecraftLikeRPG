#> bank:mob/8.test_henchman/
# テスト子分 - Tick Function
# @within mob_manager:tick (execute as @e[tag=8.test_henchman])
# 初期化チェック
execute if entity @s[tag=Init] run function bank:mob/8.test_henchman/init
execute if entity @s[tag=Init] run tag @s remove Init


# ターン制システム
scoreboard players remove @s Interval 1
execute if score @s Interval matches ..0 run function bank:mob/8.test_henchman/turn_distributor

# ここにインターバル/ターン制スキルを追加可能
