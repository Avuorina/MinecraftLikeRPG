#> mob:on_death/adj_exp
#
# 渡すEXPの計算
#
# @within function mob:on_death/
    scoreboard players operation @s EXP += @s LV
    scoreboard players operation $Diff LV = @s LV
    # プレイヤーとのレベル差を計算
        scoreboard players operation $Diff LV -= @p[tag=Attacker] LV
## レベル差によりEXPを調整
    # +5~ 格上
        execute if score $Diff LV matches 5.. run scoreboard players operation @s EXP *= $100 Const
        execute if score $Diff LV matches 5.. run scoreboard players operation @s EXP *= $150 Const
        execute if score $Diff LV matches 5.. run scoreboard players operation @s EXP /= $10000 Const
    # +-0~+4　同格
        execute if score $Diff LV matches 0..4 run scoreboard players operation @s EXP = @s EXP
    # -5~-1 格下
        execute if score $Diff LV matches -5..-1 run scoreboard players operation @s EXP *= $100 Const
        execute if score $Diff LV matches -5..-1 run scoreboard players operation @s EXP /= $2 Const
        execute if score $Diff LV matches -5..-1 run scoreboard players operation @s EXP /= $100 Const
    # ~-6 雑魚
        execute if score $Diff LV matches ..-6 run scoreboard players operation @s EXP *= $100 Const
        execute if score $Diff LV matches ..-6 run scoreboard players operation @s EXP /= $1000 Const
