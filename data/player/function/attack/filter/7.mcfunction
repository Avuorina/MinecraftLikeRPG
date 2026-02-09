# フィルター(7.0/1)

execute if entity @a[tag=Attacker,advancements={lib:player_hurt_entity={MobID7.0=true}}] if entity @s[tag=MobID7.0] run tellraw @a[tag=Attacker,limit=1] ["[",{selector:"@s"},{text:"] 攻撃したな！"},{selector:"@s"},{text:"!!"}]

execute if entity @a[tag=Attacker,advancements={lib:player_hurt_entity={MobID7.1=true}}] if entity @s[tag=MobID7.1] run tellraw @a[tag=Attacker,limit=1] ["[",{selector:"@s"},{text:"] 攻撃したな！"},{selector:"@s"},{text:"!!"}]