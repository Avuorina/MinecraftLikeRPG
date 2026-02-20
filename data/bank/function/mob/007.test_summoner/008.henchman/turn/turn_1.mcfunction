#> bank:mob/007.test_summoner/008.henchman/turn/turn_1
# ターン 1 のアクション
# @within bank:mob/007.test_summoner/008.henchman/turn_distributor
# 発動確率: 50%
function lib:calc/random100
execute if score $random _ matches ..49 run data modify storage skill: data set value {Skill:"Motion",Direction:[180f,-15f],Speed:1.0d,SpeedRange:0.2}
execute if score $random _ matches ..49 run function skill:execute

# 次のターンのセットアップ
scoreboard players set @s Interval 20
scoreboard players set @s Turn 1
