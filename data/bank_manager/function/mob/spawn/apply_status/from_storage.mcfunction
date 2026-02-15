#> bank_manager:mob/spawn/apply_status/from_storage
#
#
#
# @within function bank_manager:mob/spawn/apply_status/act

## CustomNameを保存
    data modify storage rpg_mob: Delay.Status.CustomName set from entity @s CustomName

# レベル計算
# 基準レベル読み込み
    execute store result score @s LV_Base run data get storage rpg_mob: Delay.Status.Level

# レベル差 (Factor) = 基準レベル + 進行度
    scoreboard players operation @s Factor = @s LV_Base
    scoreboard players operation @s LV = @s LV_Base
    scoreboard players operation @s Factor += $Global Progress

# 補正倍率算出 (100分率)
# Factor = 100 + (LevelDiff * 5)
    scoreboard players operation @s Factor *= $5 Const
    scoreboard players add @s Factor 100

# レベル
    scoreboard players operation @s LV *= @s Factor
    scoreboard players operation @s LV /= $100 Const

# ステータス読み込み & 補正適用
# MaxHP
    execute store result score @s MaxHP run data get storage rpg_mob: Delay.Status.HPMax
    scoreboard players operation @s MaxHP *= @s Factor
    scoreboard players operation @s MaxHP /= $100 Const
    scoreboard players operation @s HP = @s MaxHP

# STR
    execute store result score @s STR run data get storage rpg_mob: Delay.Status.ATK
    scoreboard players operation @s STR *= @s Factor
    scoreboard players operation @s STR /= $100 Const

# DEF
    execute store result score @s DEF run data get storage rpg_mob: Delay.Status.DEF
    scoreboard players operation @s DEF *= @s Factor
    scoreboard players operation @s DEF /= $100 Const

# AGI (移動速度は一旦そのまま)
    execute store result score @s AGI run data get storage rpg_mob: Delay.Status.SPD
    scoreboard players operation @s AGI *= @s Factor
    scoreboard players operation @s AGI /= $100 Const


# Gold
    execute store result score @s DropGold run data get storage rpg_mob: Delay.Status.GOLD
    scoreboard players operation @s DropGold *= @s Factor
    scoreboard players operation @s DropGold /= $100 Const

# 名前更新 (レベル表示追加)
# apply_nbt で CustomName が適用された後に実行する必要がある
# LVスコアをStorageに保存してマクロ呼び出し
    execute store result storage rpg_mob: Delay.Status.Level int 1 run scoreboard players get @s LV
    function bank_manager:mob/spawn/apply_status/level/ with storage rpg_mob: Delay.Status