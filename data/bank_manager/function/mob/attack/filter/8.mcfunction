#> bank_manager:mob/attack/filter/8
#
# モブの絞り込み
#
# @within function bank_manager:mob/attack/

execute if entity @a[tag=Victim,advancements={lib:entity_hurt_player={MobID8.0=true}}] if entity @s[tag=MobID8.0] run function bank_manager:mob/attack/filter/7
execute if entity @a[tag=Victim,advancements={lib:entity_hurt_player={MobID8.1=true}}] if entity @s[tag=MobID8.1] run function bank_manager:mob/attack/filter/7