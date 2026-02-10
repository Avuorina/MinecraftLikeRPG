#> mob:attack/filter/4
#
# モブの絞り込み
#
# @within function mob:attack/filter/5

execute if entity @a[tag=Victim,advancements={lib:entity_hurt_player={MobID4.0=true}}] if entity @s[tag=MobID4.0] run function mob:attack/filter/3
execute if entity @a[tag=Victim,advancements={lib:entity_hurt_player={MobID4.1=true}}] if entity @s[tag=MobID4.1] run function mob:attack/filter/3
