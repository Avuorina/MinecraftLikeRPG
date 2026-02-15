#> bank_manager:mob/attack/filter/7
#
# モブの絞り込み
#
# @within function bank_manager:mob/attack/filter/8

execute if entity @a[tag=Victim,advancements={lib:entity_hurt_player={MobID7.0=true}}] if entity @s[tag=MobID7.0] run function bank_manager:mob/attack/filter/6
execute if entity @a[tag=Victim,advancements={lib:entity_hurt_player={MobID7.1=true}}] if entity @s[tag=MobID7.1] run function bank_manager:mob/attack/filter/6