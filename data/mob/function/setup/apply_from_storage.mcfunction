# レベル計算
# 基準レベル読み込み
    execute store result score @s LV_Base run data get storage rpg_mob: レベル

# 現在レベル = 基準 + 進行度
    scoreboard players operation @s LV = @s LV_Base
    scoreboard players operation @s LV += Global Progress

# レベル差 (Factor) = 現在 - 基準
    scoreboard players operation @s Factor = @s LV
    scoreboard players operation @s Factor -= @s LV_Base

# 補正倍率算出 (100分率)
# Factor = 100 + (LevelDiff * 5)
    scoreboard players operation @s Factor *= $5 Const
    scoreboard players add @s Factor 100

# ステータス読み込み & 補正適用
# MaxHP
    execute store result score @s MaxHP run data get storage rpg_mob: 最大HP
    scoreboard players operation @s MaxHP *= @s Factor
    scoreboard players operation @s MaxHP /= 100 Const
    scoreboard players operation @s HP = @s MaxHP

# STR
    execute store result score @s STR run data get storage rpg_mob: 物理攻撃力
    scoreboard players operation @s STR *= @s Factor
    scoreboard players operation @s STR /= 100 Const

# DEF
    execute store result score @s DEF run data get storage rpg_mob: 物理防御力
    scoreboard players operation @s DEF *= @s Factor
    scoreboard players operation @s DEF /= 100 Const

# AGI (移動速度は一旦そのまま)
    execute store result score @s AGI run data get storage rpg_mob: 素早さ
    scoreboard players operation @s AGI *= @s Factor
    scoreboard players operation @s AGI /= 100 Const

# LUCK
    execute store result score @s LUCK run data get storage rpg_mob: 運
    # LUCKは補正なしでもいいかも？一旦ありで

    # AIパラメータ適用 (移動速度、索敵範囲など)
        function ai:apply_attributes

    # 見た目・装備適用 (Storage -> Entity)
        function mob:setup/apply_nbt

    # 名前更新 (レベル表示追加)
    # apply_nbt で CustomName が適用された後に実行する必要がある
    # LVスコアをStorageに保存してマクロ呼び出し
        execute store result storage rpg_mob: lv int 1 run scoreboard players get @s LV
        function mob:setup/level/ with storage rpg_mob:

# アトリビュートに代入
    function status:apply_mob

# 初期化済みタグ付与
    tag @s add mob.initialized
