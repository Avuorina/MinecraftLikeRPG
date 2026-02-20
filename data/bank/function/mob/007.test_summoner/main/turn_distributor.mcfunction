#> bank:mob/007.test_summoner/main/turn_distributor
# テストサモナー のターン振り分け
# @within bank:mob/007.test_summoner/main/
execute if score @s Turn matches 1 run return run function bank:mob/007.test_summoner/main/turn/turn_1
execute if score @s Turn matches 2 run return run function bank:mob/007.test_summoner/main/turn/turn_2
execute unless score @s Turn matches 1..2 run scoreboard players set @s Turn 1
