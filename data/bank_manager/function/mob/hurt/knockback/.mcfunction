#> mob:on_hurt/knockback/
#
#
#
# @within function mob:on_hurt/hit

#TODO
# 攻撃したプレイヤーの設定
# XZ方向へのふっとばし補正 e) scoreboard players set &XPower _ 100
# Y方向へのふっとばし補正 e) scoreboard players set &YPower _ 100
    scoreboard players set &XPower _ 100
    scoreboard players set &YPower _ 100
    scoreboard players set &ZPower _ 100
#Position 取得用AEC召喚
# 既に回転は引き継がれているので、Position変更のみ行う
    execute positioned 0.0 0.0 0.0 run summon area_effect_cloud ^ ^ ^0.4 {Tags:["Knockback"]}
    # AECの位置を取得
        data modify storage bank:mob temp.Pos set from entity @e[type=area_effect_cloud,tag=Knockback,sort=nearest,limit=1] Pos
        # Debug: AEC召喚確認
            #execute if entity @e[type=area_effect_cloud,tag=Knockback] run say AEC Spawned!
            #execute unless entity @p[tag=Attacker] run say WARNING: No Attacker Found for Rotation!

# いつものノックバックはY軸方向は固定なので上書き
    data modify storage bank:mob temp.Pos[1] set value 0.32
    execute store result score $KnockbackX _ run data get storage bank:mob temp.Pos[0] 1000
    execute store result score $KnockbackY _ run data get storage bank:mob temp.Pos[1] 1000
    execute store result score $KnockbackZ _ run data get storage bank:mob temp.Pos[2] 1000

# Debug: Scores before Mult
                #tellraw @a ["X:",{"score":{"name":"$KnockbackX","objective":"_"}}," Y:",{"score":{"name":"$KnockbackY","objective":"_"}}," Z:",{"score":{"name":"$KnockbackZ","objective":"_"}}]

# ベクトル補正
    scoreboard players operation $KnockbackX _ *= &XPower _
    scoreboard players operation $KnockbackY _ *= &YPower _
    scoreboard players operation $KnockbackZ _ *= &ZPower _

# Debug: Scores after Mult
    #tellraw @a ["Post-Mult X:",{"score":{"name":"$KnockbackX","objective":"_"}}," Y:",{"score":{"name":"$KnockbackY","objective":"_"}}," Z:",{"score":{"name":"$KnockbackZ","objective":"_"}}]

# Motionの適用
    execute store result storage bank:mob temp.Pos[0] double 0.00001 run scoreboard players get $KnockbackX _
    execute store result storage bank:mob temp.Pos[1] double 0.00001 run scoreboard players get $KnockbackY _
    execute store result storage bank:mob temp.Pos[2] double 0.00001 run scoreboard players get $KnockbackZ _
    data modify entity @s Motion set from storage bank:mob temp.Pos

# Debug: Applied Motion
    data get entity @s Motion

# RESET
    data remove storage bank:mob temp.Pos
    scoreboard players reset $KnockbackX _
    scoreboard players reset $KnockbackY _
    scoreboard players reset $KnockbackZ _
    # X,YPowerは1tick送らせてリセット
    schedule function bank_manager:mob/hurt/knockback/reset 1t