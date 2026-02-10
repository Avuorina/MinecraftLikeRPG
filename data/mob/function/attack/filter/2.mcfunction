#> mob:attack/filter/2
#
# モブの絞り込み
#
# @within function mob:attack/filter/3

execute if entity @a[tag=Victim,advancements={lib:entity_hurt_player={MobID2.0=true}}] if entity @s[tag=MobID2.0] run function mob:attack/filter/1
execute if entity @a[tag=Victim,advancements={lib:entity_hurt_player={MobID2.1=true}}] if entity @s[tag=MobID2.1] run function mob:attack/filter/1
