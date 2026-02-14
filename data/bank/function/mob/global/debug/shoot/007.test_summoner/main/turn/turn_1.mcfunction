# ターン 1 のアクション
data modify storage rpg_skill: data set value {Skill:"Summon",MobID:"008.henchman",Count:3,Offset:[0,0,2],Spread:2.0}
function skill:execute
scoreboard players remove @s MP 10

# 次のターンのセットアップ
scoreboard players set @s Interval 20
scoreboard players set @s Turn 2
