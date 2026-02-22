#> bank:mob/6.test_master/turn/turn_3
# ターン 3 のアクション
# @within bank:mob/6.test_master/turn_distributor
data modify storage skill: data set value {Skill:"ChangeNBT",NBT:{equipment:{mainhand:{id:"minecraft:iron_sword",count:1}}}}
function skill:execute

# 次のターンのセットアップ
scoreboard players set @s Interval 60
scoreboard players set @s Turn 1
