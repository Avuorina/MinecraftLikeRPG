# フィルター(8.0/1)
#say 8
execute if entity @a[tag=Attacker,advancements={lib:player_hurt_entity={MobID8.0=true}}] if entity @s[tag=MobID8.0] run function player:attack/filter/7

execute if entity @a[tag=Attacker,advancements={lib:player_hurt_entity={MobID8.1=true}}] if entity @s[tag=MobID8.1] run function player:attack/filter/7