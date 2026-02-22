#> bank:mob/6.test_master/
# テストやり手 - Tick Function
# @within mob_manager:tick (execute as @e[tag=6.test_master])
# 初期化チェック
execute if entity @s[tag=Init] run function bank:mob/6.test_master/init
execute if entity @s[tag=Init] run tag @s remove Init


# ターン制システム
scoreboard players remove @s Interval 1
execute if score @s Interval matches ..0 run function bank:mob/6.test_master/turn_distributor

# ここにインターバル/ターン制スキルを追加可能
