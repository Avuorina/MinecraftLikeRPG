# フィルター(1.0/1)

execute if entity @a[tag=Attacker,advancements={lib:player_hurt_entity={MobID1.0=true}}] if entity @s[tag=MobID1.0] run tellraw @a[tag=Attacker,limit=1] ["[",{selector:"@s"},{text:"] 攻撃したな！"},{selector:"@s"},{text:"!!"}]

execute if entity @a[tag=Attacker,advancements={lib:player_hurt_entity={MobID1.1=true}}] if entity @s[tag=MobID1.1] run tellraw @a[tag=Attacker,limit=1] ["[",{selector:"@s"},{text:"] 攻撃したな！"},{selector:"@s"},{text:"!!"}]