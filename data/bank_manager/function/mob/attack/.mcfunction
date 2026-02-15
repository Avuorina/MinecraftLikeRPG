#> bank_manager:mob/attack/
#
# MOBによる攻撃
#
# @within advancement:entity_hurt_player

# 被害者はこいつ
    tag @s add Victim

# 加害者はおまえ
    execute as @e[type=#lib:every_mob,distance=..100] run function bank_manager:mob/attack/filter/8

# 死亡処理
    execute if entity @s[scores={HP=..0}] run function player:death

# RESET
    advancement revoke @s only lib:entity_hurt_player
    tag @s remove Victim
    #say REVOKED