#> bank_manager:mob/attack/filter/6
#
# モブの絞り込み
#
# @within function bank_manager:mob/attack/filter/7

execute if entity @a[tag=Victim,advancements={lib:entity_hurt_player={MobID6.0=true}}] if entity @s[tag=MobID6.0] run function bank_manager:mob/attack/filter/5
execute if entity @a[tag=Victim,advancements={lib:entity_hurt_player={MobID6.1=true}}] if entity @s[tag=MobID6.1] run function bank_manager:mob/attack/filter/5