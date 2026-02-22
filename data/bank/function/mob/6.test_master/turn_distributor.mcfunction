#> bank:mob/6.test_master/turn_distributor
# テストやり手 のターン振り分け
# @within bank:mob/6.test_master/
execute if score @s Turn matches 1 run return run function bank:mob/6.test_master/turn/turn_1
execute if score @s Turn matches 2 run return run function bank:mob/6.test_master/turn/turn_2
execute if score @s Turn matches 3 run return run function bank:mob/6.test_master/turn/turn_3
execute unless score @s Turn matches 1..3 run scoreboard players set @s Turn 1
