# テストやり手 のターン振り分け
execute if score @s Turn matches 1 run function bank:mob/global/debug/blow/006.test_master/turn/turn_1
execute if score @s Turn matches 2 run function bank:mob/global/debug/blow/006.test_master/turn/turn_2
execute if score @s Turn matches 3 run function bank:mob/global/debug/blow/006.test_master/turn/turn_3
execute unless score @s Turn matches 1..3 run scoreboard players set @s Turn 1
