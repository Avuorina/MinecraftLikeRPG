#> bank:mob/6.test_master/turn/turn_1
# ターン 1 のアクション
# @within bank:mob/6.test_master/turn_distributor
data modify storage skill: data set value {Skill:"Motion",Direction:[-180f,-0f],Speed:1.0d,SpeedRange:0.2}
function skill:execute
scoreboard players remove @s MP 3

# 次のターンのセットアップ
scoreboard players set @s Interval 20
scoreboard players set @s Turn 2
