# ターン 1 のアクション
data modify storage rpg_skill: data set value {Skill:"Motion",Direction:[180f,-15f],Speed:1.0d,SpeedRange:0.2}
function skill:execute
scoreboard players remove @s MP 3

# 次のターンのセットアップ
scoreboard players set @s Interval 20
scoreboard players set @s Turn 2
say turn 1