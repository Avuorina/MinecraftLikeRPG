# フィルター(4.0/1)

execute if entity @a[tag=Attacker,advancements={lib:player_hurt_entity={MobID4.0=true}}] if entity @s[tag=MobID4.0] run function player:attack/filter/3

execute if entity @a[tag=Attacker,advancements={lib:player_hurt_entity={MobID4.1=true}}] if entity @s[tag=MobID4.1] run function player:attack/filter/3