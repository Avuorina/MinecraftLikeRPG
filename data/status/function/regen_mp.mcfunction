# MP自動回復
# INTによる回復速度ボーナス
# 基本タイマー +1
# ボーナス: + (INT / 10)
# INT 10 -> +1 (計+2/tick = 2倍速)
# INT 20 -> +2 (計+3/tick = 3倍速)

scoreboard players add @a Timer 1

# INTボーナス計算と加算
# temp = INT / 10
    scoreboard players operation @s _ = @s int
    scoreboard players operation @s _ /= 10 _
    scoreboard players operation @s Timer += @s _

execute as @s[scores={Timer=60..}] run function status:regen_mp_tick
