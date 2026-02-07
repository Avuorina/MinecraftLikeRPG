#> lib:left_click/target
#
#
#
# @within function lib:left_click/attacked

# HitTagをつける。
    #particle small_flame ~ ~ ~ 0 0 0 0 1 force
    execute as @e[tag=ENEMY,dx=0] positioned ~-0.75 ~-0.75 ~-0.75 if entity @s[dx=0] run tag @s add Hit
    # リーチの限界まで再帰
        scoreboard players remove @s Reach 1
        execute if score @s Reach matches 1.. positioned ^ ^ ^0.25 run function lib:left_click/target
