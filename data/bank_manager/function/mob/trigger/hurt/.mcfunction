#> bank_manager:mob/trigger/hurt/
#
# Hurt イベント処理
#
# @within bank_manager:mob/trigger/ (execute if entity @s[tag=MobHurt])

function bank_manager:mob/hurt/hit
tag @s remove MobHurt
