#> bank:mob/7.test_summoner/turn_distributor
# テストサモナー のターン振り分け
# @within bank:mob/7.test_summoner/
execute if score @s Turn matches 1 run return run function bank:mob/7.test_summoner/turn/turn_1
execute if score @s Turn matches 2 run return run function bank:mob/7.test_summoner/turn/turn_2
execute unless score @s Turn matches 1..2 run scoreboard players set @s Turn 1
