#> mob:attack/
#
# MOBによる攻撃
#
# @within advancement:entity_hurt_player

# 被害者はこいつ
    tag @s add Victim

# 加害者はおまえ
    execute as @e[type=#lib:every_mob,distance=..100] run function mob:attack/filter/8

# RESET
    advancement revoke @s only lib:entity_hurt_player
    tag @s remove Victim