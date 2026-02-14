# テスト子分 のターン振り分け
execute if score @s Turn matches 1 run return run function bank:mob/global/debug/shoot/007.test_summoner/008.henchman/turn/turn_1
execute unless score @s Turn matches 1..1 run scoreboard players set @s Turn 1
