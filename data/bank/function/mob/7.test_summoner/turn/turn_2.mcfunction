#> bank:mob/7.test_summoner/turn/turn_2
# ターン 2 のアクション
# @within bank:mob/7.test_summoner/turn_distributor
data modify storage skill: data set value {Skill:"Motion",Direction:[180f,-15f],Speed:-1.0d,SpeedRange:0.2}
function skill:execute

# 次のターンのセットアップ
scoreboard players set @s Interval 1000
scoreboard players set @s Turn 1
