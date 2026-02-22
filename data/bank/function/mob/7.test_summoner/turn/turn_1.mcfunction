#> bank:mob/7.test_summoner/turn/turn_1
# ターン 1 のアクション
# @within bank:mob/7.test_summoner/turn_distributor
data modify storage skill: data set value {Skill:"Summon",MobID:"8",Count:3,Offset:[0,0,-2],Spread:2.0}
function skill:execute
scoreboard players remove @s MP 10

# 次のターンのセットアップ
scoreboard players set @s Interval 20
scoreboard players set @s Turn 2
