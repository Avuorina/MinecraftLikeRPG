#> mob:attack/filter/5
#
# モブの絞り込み
#
# @within function mob:attack/filter/6

execute if entity @a[tag=Victim,advancements={lib:entity_hurt_player={MobID5.0=true}}] if entity @s[tag=MobID5.0] run function mob:attack/filter/4
execute if entity @a[tag=Victim,advancements={lib:entity_hurt_player={MobID5.1=true}}] if entity @s[tag=MobID5.1] run function mob:attack/filter/4
