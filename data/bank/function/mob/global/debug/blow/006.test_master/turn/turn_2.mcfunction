# ターン 2 のアクション
data modify storage rpg_skill: data set value {Skill:"ChangeNBT",NBT:{equipment:{mainhand:{id:"minecraft:diamond_sword",count:1}}}}
function skill:execute

# 次のターンのセットアップ
scoreboard players set @s Interval 100
scoreboard players set @s Turn 3
