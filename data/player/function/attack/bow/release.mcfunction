#> player:attack/bow/release
# 弓のチャージ解放（発射）処理
# @within function player:attack/bow/charge_tick

# チャージ量に応じた倍率(10倍値)を $ChargeModifier _ に設定
    execute if score @s BowCharge matches ..39 run scoreboard players set $ChargeModifier _ 5
    execute if score @s BowCharge matches 40..59 run scoreboard players set $ChargeModifier _ 10
    execute if score @s BowCharge matches 60.. run scoreboard players set $ChargeModifier _ 15

# ピッチ（上下の視点角）を変数に取得 (元々bow/tickにあった処理)
    execute store result score $Pitch _ run data get entity @s Rotation[1]

# 通常攻撃として処理 (ピッチが上を向きすぎていない場合)
    execute if score $Pitch _ matches -49.. run function player:attack/bow/attack_normal

# チャージ状態のリセット
    scoreboard players reset @s BowCharge
    tag @s remove ChargingBow
