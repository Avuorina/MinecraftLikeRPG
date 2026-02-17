# フィルター(3.0/1)

execute if entity @a[tag=Attacker,advancements={lib:player_hurt_entity={MobID3.0=true}}] if entity @s[tag=MobID3.0] run function player:attack/filter/2

execute if entity @a[tag=Attacker,advancements={lib:player_hurt_entity={MobID3.1=true}}] if entity @s[tag=MobID3.1] run function player:attack/filter/2