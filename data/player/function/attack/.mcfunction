#> player:attack
#
#
#
# @within advancement lib:check_Lclick

# 与えたダメージを一時スコアに代入
    function player:attack/dmg_dealt

# 敵を殴ったね！？
    function player:attack/update_reach
        # ここでHitタグをつける
    execute at @s anchored eyes positioned ^ ^ ^ positioned ~-0.125 ~-0.125 ~-0.125 run function player:attack/target
    # Hitタグがついた敵にノックバック
        tag @s add Attacker
        execute as @s[tag=Attacker] run say I AM ATTACKER
        execute as @e[tag=Hit,tag=ENEMY,distance=..10] at @s run say I AM HIT
        execute as @e[tag=Hit,tag=ENEMY,distance=..10] at @s run function mob:on_hurt/hit
        execute as @e[tag=ENEMY,type=#lib:every_mob,distance=..100] run function player:attack/filter/8
        tag @s remove Attacker
        ## Debug
        #title @s title {text:"attacked"}
            ## パーティクルを表示
                execute at @s anchored eyes run particle crit ^ ^ ^1 0.1 0.1 0.1 0 1 force @s
                execute at @s run playsound entity.player.attack.nodamage player @s ~ ~ ~ 1 1

## reset
    advancement revoke @s only lib:player_hurt_entity
    tag @s remove Attacker
