# テストやり手 - Tick Function
# 初期化チェック
execute if entity @s[tag=Init] run function bank:mob/global/debug/blow/006.test_master/init
execute if entity @s[tag=Init] run tag @s remove Init


# ターン制システム
scoreboard players remove @s Interval 1
execute if score @s Interval matches ..0 run function bank:mob/global/debug/blow/006.test_master/turn_distributor

# ここにインターバル/ターン制スキルを追加可能
