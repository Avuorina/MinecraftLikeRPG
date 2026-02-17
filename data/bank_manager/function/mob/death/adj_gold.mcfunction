#> bank_manager:mob/death/adj_gold
#
# 渡すGOLDの計算
#
# @within function bank_manager:mob/death/
    scoreboard players operation @s DropGold *= $5 Const
    execute store result score $Random _ run random value 8..12
    scoreboard players operation @s DropGold *= $Random _
    scoreboard players operation @s DropGold /= $10 Const