# MaxHP更新（Set、割合維持）
# 旧MaxHP保存
    scoreboard players operation $Old MaxHP = @s MaxHP

# 新MaxHP適用
    execute store result score @s MaxHP run data get storage rpg_skill: data.set.MaxHP

# 計算: HP = HP * NewMax / OldMax
# 0除算回避
    execute unless score $Old MaxHP matches 1.. run scoreboard players set $Old MaxHP 1

scoreboard players operation @s HP *= @s MaxHP
scoreboard players operation @s HP /= $Old MaxHP
