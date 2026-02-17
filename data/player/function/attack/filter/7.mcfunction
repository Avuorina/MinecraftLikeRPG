# フィルター(7.0/1)

execute if entity @a[tag=Attacker,advancements={lib:player_hurt_entity={MobID7.0=true}}] if entity @s[tag=MobID7.0] run function player:attack/filter/6

execute if entity @a[tag=Attacker,advancements={lib:player_hurt_entity={MobID7.1=true}}] if entity @s[tag=MobID7.1] run function player:attack/filter/6