#> bank:mob/007.test_summoner/008.henchman/turn_distributor
# テスト子分 のターン振り分け
# @within bank:mob/007.test_summoner/008.henchman/
execute if score @s Turn matches 1 run return run function bank:mob/007.test_summoner/008.henchman/turn/turn_1
execute unless score @s Turn matches 1..1 run scoreboard players set @s Turn 1
