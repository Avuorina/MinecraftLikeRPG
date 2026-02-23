#> player:attack/tick
#
#
#
# @within function player:tick

## 左クリック検知用のモブを召喚
    execute as @a[team=!DEBUG] at @s run function player:attack/summon

## 弓の使用を検知 (BankItemの弓を装備している場合のみ)
    execute as @a[scores={Used.CoaS=1..},nbt={SelectedItem:{components:{"minecraft:custom_data":{BankItem:[{WeaponType:"bow"}]}}}}] at @s run function player:attack/bow/tick

## ただの武器（弓以外）を使った場合のリセット 
    execute as @a[scores={Used.CoaS=1..},nbt=!{SelectedItem:{components:{"minecraft:custom_data":{BankItem:[{WeaponType:"bow"}]}}}}] run scoreboard players reset @s Used.CoaS

