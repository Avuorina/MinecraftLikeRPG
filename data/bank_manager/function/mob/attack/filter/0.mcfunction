#> bank_manager:mob/attack/filter/0
#
# モブの絞り込み
#
# @within function bank_manager:mob/attack/filter/1

execute if entity @a[tag=Victim,advancements={lib:entity_hurt_player={MobID0.0=true}}] if entity @s[tag=MobID0.0] run function bank_manager:mob/attack/act
execute if entity @a[tag=Victim,advancements={lib:entity_hurt_player={MobID0.1=true}}] if entity @s[tag=MobID0.1] run function bank_manager:mob/attack/act