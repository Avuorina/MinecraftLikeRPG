#> bank:mob/007.test_summoner/008.henchman/
# テスト子分 - Tick Function
# @within mob_manager:tick (execute as @e[tag=007.test_summoner])
# 初期化チェック
execute if entity @s[tag=Init] run function bank:mob/007.test_summoner/008.henchman/init
execute if entity @s[tag=Init] run tag @s remove Init


# ターン制システム
scoreboard players remove @s Interval 1
execute if score @s Interval matches ..0 run function bank:mob/007.test_summoner/008.henchman/turn_distributor

# ここにインターバル/ターン制スキルを追加可能
