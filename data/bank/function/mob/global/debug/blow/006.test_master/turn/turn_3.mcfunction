# ターン 3 のアクション
data modify storage rpg_skill: data set value {Skill:"ChangeNBT",NBT:{equipment:{mainhand:{id:"minecraft:iron_sword",count:1}}}}
function skill:execute

# 次のターンのセットアップ
scoreboard players set @s Interval 60
scoreboard players set @s Turn 1
