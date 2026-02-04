#> lib:left_click/target
#
#
#
# @within function lib:left_click/attacked

# HitTagをつける。
    execute as @e[tag=ENEMY,dx=0] positioned ~-0.75 ~-0.75 ~-0.75 if entity @s[dx=0] run tag @s add Hit
# リーチの限界まで再帰
    execute positioned ^ ^ ^0.25 if entity @s[distance=..5] run function lib:left_click/target