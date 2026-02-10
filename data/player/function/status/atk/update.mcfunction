# 攻撃力計算
# WeaponATK (NBT) + STR補正
# 式: Base * (1 + STR/100) + STR/5

# 1. 武器攻撃力取得 (BankItem[0].ATK)
    scoreboard players set @s WeaponATK 0
    execute store result score @s WeaponATK run data get entity @s SelectedItem.components."minecraft:custom_data".BankItem[0].ATK
    execute unless score @s WeaponATK matches 1.. run scoreboard players set @s WeaponATK 1

# 2. STR補正計算
# A項: STR / 5   ( $X )
    scoreboard players operation $X _ = @s STR
    scoreboard players operation $X _ /= $5 Const

# B項: Base * (1 + STR/100) = Base * (100 + STR) / 100
# 100 + STR を $Y に計算
    scoreboard players operation $Y _ = @s STR
    scoreboard players operation $Y _ += $100 Const

# Base * $Y
    scoreboard players operation @s WeaponATK *= $Y _

# 結果 / 100
    scoreboard players operation @s WeaponATK /= $100 Const

# 3. 合算 (A項 + B項)
    scoreboard players operation @s WeaponATK += $X _

# 4. 最終値をATKにコピー
    scoreboard players operation @s ATK = @s WeaponATK

# 5. 攻撃速度計算 (ATKSpeed - 4.0)
# デフォルト値 4.0 (=400) をセット
    scoreboard players set @s _ 400
    # BankItem[0].ATKSpeed を取得 (x100して計算)
        execute store result score @s _ run data get entity @s SelectedItem.components."minecraft:custom_data".BankItem[0].ATKSpeed 100
        execute unless score @s _ matches 1.. run scoreboard players set @s _ 400
    # デフォルト(4.0 = 400) を引く
        scoreboard players remove @s _ 400
    # storageに保存 (double)
        execute store result storage player: speed double 0.01 run scoreboard players get @s _

# 6. マクロ呼び出し
    function player:status/atk/macro with storage player:

# RESET
    scoreboard players reset @s _
    scoreboard players reset @s WeaponATK
    scoreboard players reset $X _
    scoreboard players reset $Y _
    data remove storage player: speed

