#> bank:mob/007.test_summoner/main/
# テストサモナー - Tick Function
# @within mob_manager:tick (execute as @e[tag=007.test_summoner])
# 初期化チェック
execute if entity @s[tag=Init] run function bank:mob/007.test_summoner/main/init
execute if entity @s[tag=Init] run tag @s remove Init


# ターン制システム
scoreboard players remove @s Interval 1
execute if score @s Interval matches ..0 run function bank:mob/007.test_summoner/main/turn_distributor

# ここにインターバル/ターン制スキルを追加可能
