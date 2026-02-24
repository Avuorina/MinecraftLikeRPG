#> player:attack/bow/shoot
# 召喚された矢に対して実行され、マーカー間の距離からMotionを算出・自身に適用する処理
# @within function player:attack/bow/attack_normal, player:attack/bow/skill/meteor/start

# 共通の手順として、$10 _ に10を代入
    scoreboard players set $10 _ 10

# X
    execute store result score $X1 _ run data get entity @e[type=marker,tag=BowOrigin,limit=1] Pos[0] 1000
    execute store result score $X2 _ run data get entity @e[type=marker,tag=BowTarget,limit=1] Pos[0] 1000
    scoreboard players operation $X2 _ -= $X1 _
    scoreboard players operation $X2 _ *= $ChargeModifier _
    scoreboard players operation $X2 _ /= $10 _
    execute store result entity @s Motion[0] double 0.003 run scoreboard players get $X2 _

# Y
    execute store result score $Y1 _ run data get entity @e[type=marker,tag=BowOrigin,limit=1] Pos[1] 1000
    execute store result score $Y2 _ run data get entity @e[type=marker,tag=BowTarget,limit=1] Pos[1] 1000
    scoreboard players operation $Y2 _ -= $Y1 _
    scoreboard players operation $Y2 _ *= $ChargeModifier _
    scoreboard players operation $Y2 _ /= $10 _
    execute store result entity @s Motion[1] double 0.003 run scoreboard players get $Y2 _

# Z
    execute store result score $Z1 _ run data get entity @e[type=marker,tag=BowOrigin,limit=1] Pos[2] 1000
    execute store result score $Z2 _ run data get entity @e[type=marker,tag=BowTarget,limit=1] Pos[2] 1000
    scoreboard players operation $Z2 _ -= $Z1 _
    scoreboard players operation $Z2 _ *= $ChargeModifier _
    scoreboard players operation $Z2 _ /= $10 _
    execute store result entity @s Motion[2] double 0.003 run scoreboard players get $Z2 _

# 計算・不要になったマーカーを消去
    kill @e[type=marker,tag=BowOrigin]
    kill @e[type=marker,tag=BowTarget]

# 矢のステータス計算（arrow_init）を呼び出す
    function player:attack/bow/arrow_init
