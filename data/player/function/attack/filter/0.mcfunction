# フィルター(0.0/1)

execute if entity @a[tag=Attacker,advancements={lib:player_hurt_entity={MobID0.0=true}}] if entity @s[tag=MobID0.0] run function bank_manager:mob/hurt/hit

execute if entity @a[tag=Attacker,advancements={lib:player_hurt_entity={MobID0.1=true}}] if entity @s[tag=MobID0.1] run function bank_manager:mob/hurt/hit