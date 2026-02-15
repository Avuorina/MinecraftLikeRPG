#> player:death
#
# プレイヤー死亡処理
#
# @within function bank_manager:mob/attack/

# 葬送
    kill @s

# 全快
    scoreboard players operation @s HP = @s MaxHP
    scoreboard players operation @s MP = @s MaxMP

    function player:status/hp/update