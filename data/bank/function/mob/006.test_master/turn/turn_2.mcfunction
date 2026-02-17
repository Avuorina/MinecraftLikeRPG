# ターン 2 のアクション
# 発動確率: 30%
function lib:calc/random100
execute if score $random _ matches ..29 run data modify storage rpg_skill: data set value {Skill:"ChangeNBT",NBT:{equipment:{mainhand:{id:"minecraft:diamond_sword",count:1}}}}
execute if score $random _ matches ..29 run function skill:execute

# 次のターンのセットアップ
scoreboard players set @s Interval 100
scoreboard players set @s Turn 3
