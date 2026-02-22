#> bank:mob/8.test_henchman/turn_distributor
# テスト子分 のターン振り分け
# @within bank:mob/8.test_henchman/
execute if score @s Turn matches 1 run return run function bank:mob/8.test_henchman/turn/turn_1
execute unless score @s Turn matches 1..1 run scoreboard players set @s Turn 1
