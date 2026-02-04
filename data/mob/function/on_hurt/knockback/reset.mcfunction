#> mob:on_hurt/knockback/reset
#
#
#
# @within function mob:on_hurt/knockback/

# RESET
scoreboard players reset &XPower _
scoreboard players reset &YPower _
scoreboard players reset &ZPower _
kill @e[type=area_effect_cloud,tag=Knockback]