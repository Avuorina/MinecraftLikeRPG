#> skill:change_status/maxhp_add

# MaxHP更新（加算、割合維持）
# 旧MaxHP保存
    scoreboard players operation $Old MaxHP = @s MaxHP

# 加算値取得
    execute store result score $Temp _ run data get storage skill: data.add.MaxHP

# 新MaxHP計算
    scoreboard players operation @s MaxHP += $Temp _

# 計算: HP = HP * NewMax / OldMax
# 0除算回避
    execute unless score $Old MaxHP matches 1.. run scoreboard players set $Old MaxHP 1

scoreboard players operation @s HP *= @s MaxHP
scoreboard players operation @s HP /= $Old MaxHP
