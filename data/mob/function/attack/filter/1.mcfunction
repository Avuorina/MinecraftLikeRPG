#> mob:attack/filter/1
#
# モブの絞り込み
#
# @within function mob:attack/filter/2

execute if entity @a[tag=Victim,advancements={lib:entity_hurt_player={MobID1.0=true}}] if entity @s[tag=MobID1.0] run function mob:attack/filter/2
execute if entity @a[tag=Victim,advancements={lib:entity_hurt_player={MobID1.1=true}}] if entity @s[tag=MobID1.1] run function mob:attack/filter/2