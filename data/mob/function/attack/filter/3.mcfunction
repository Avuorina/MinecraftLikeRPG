#> mob:attack/filter/3
#
# モブの絞り込み
#
# @within function mob:attack/filter/4

execute if entity @a[tag=Victim,advancements={lib:entity_hurt_player={MobID3.0=true}}] if entity @s[tag=MobID3.0] run function mob:attack/filter/2
execute if entity @a[tag=Victim,advancements={lib:entity_hurt_player={MobID3.1=true}}] if entity @s[tag=MobID3.1] run function mob:attack/filter/2
