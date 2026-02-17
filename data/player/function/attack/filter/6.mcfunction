# フィルター(6.0/1)

execute if entity @a[tag=Attacker,advancements={lib:player_hurt_entity={MobID6.0=true}}] if entity @s[tag=MobID6.0] run function player:attack/filter/5

execute if entity @a[tag=Attacker,advancements={lib:player_hurt_entity={MobID6.1=true}}] if entity @s[tag=MobID6.1] run function player:attack/filter/5