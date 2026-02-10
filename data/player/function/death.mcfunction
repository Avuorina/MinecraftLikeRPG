#> player:death
#
# プレイヤー死亡処理
#
# @within function mob:attack/

# 葬送
    kill @s

# 全快
    scoreboard players operation @s HP = @s MaxHP
    scoreboard players operation @s MP = @s MaxMP