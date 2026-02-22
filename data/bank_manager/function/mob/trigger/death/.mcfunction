#> bank_manager:mob/trigger/death/
#
# Death イベント処理
#
# @within bank_manager:mob/trigger/ (execute if entity @s[tag=MobDeath])

function bank_manager:mob/death/
tag @s remove MobDeath
