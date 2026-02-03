# R:advancement lib:check_Lclick

# 与えたダメージを一時スコアに代入
    scoreboard players operation &DmgDealt _ = @s STR

# 敵を殴ったね！？
    execute at @s anchored eyes positioned ^ ^ ^ positioned ~-0.125 ~-0.125 ~-0.125 run function lib:left_click/target
# Hitタグがついた敵にノックバック
    tag @s add Attacker
    #execute as @s[tag=Attacker] run say I AM ATTACKER
    #execute as @e[tag=Hit,tag=ENEMY,distance=..10] at @s run say I AM HIT
    execute as @e[tag=Hit,tag=ENEMY,distance=..10] at @s run function mob:on_hurt/hit
    tag @s remove Attacker
## Debug
    #title @s title {text:"attacked"}
## パーティクルを表示
    execute at @s anchored eyes run particle crit ^ ^ ^1 0.1 0.1 0.1 0 1 force @s
    execute at @s run playsound entity.player.attack.nodamage player @s ~ ~ ~ 1 1

## reset
    advancement revoke @s only lib:check_l.click