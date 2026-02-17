# フィルター(5.0/1)

execute if entity @a[tag=Attacker,advancements={lib:player_hurt_entity={MobID5.0=true}}] if entity @s[tag=MobID5.0] run function player:attack/filter/4

execute if entity @a[tag=Attacker,advancements={lib:player_hurt_entity={MobID5.1=true}}] if entity @s[tag=MobID5.1] run function player:attack/filter/4