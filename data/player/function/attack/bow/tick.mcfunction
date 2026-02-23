#> player:attack/bow/tick
# キャロットオンアスティック（弓）の右クリックを検知した際の処理
# @within function player:attack/tick

# ピッチ（上下の視点角）を変数に取得
    execute store result score $Pitch _ run data get entity @s Rotation[1]

# 通常攻撃
    execute if score $Pitch _ matches -49.. run function player:attack/bow/attack_normal

# リセット
    scoreboard players reset @s Used.CoaS
