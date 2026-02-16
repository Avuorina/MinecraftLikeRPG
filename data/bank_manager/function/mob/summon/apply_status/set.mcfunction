#> bank_manager:mob/summon/set_data
#
# 召喚されたbank:mobのデータを初期化します
#
# @input storage bank:mob
#   ID : int
#   Name? : TextComponentString
#   Health? : float
#   AttackDamage? : double
#   Defense? : double
#   SpecialDefense? : double
#   Speed? : double
#   FollowRange? : double
#   KnockBackResist? : double
#
#   Resist.Physical : float
#   Resist.Magic : float
#   Resist.Fire : float
#   Resist.Water : float
#   Resist.Thunder : float
#   Field? : compound
#   FieldOverride? : compound
# @within function bank_manager:mob/summon/init

# 検証
    # execute unless data storage bank:mob Name run
    execute unless data storage bank:mob Costume.Mainhand run data modify storage bank:mob Costume.Mainhand set value {}
    execute unless data storage bank:mob Costume.Offhand run data modify storage bank:mob Costume.Offhand set value {}
    execute unless data storage bank:mob Costume.Head run data modify storage bank:mob Costume.Head set value {}
    execute unless data storage bank:mob Costume.Chest run data modify storage bank:mob Costume.Chest set value {}
    execute unless data storage bank:mob Costume.Legs run data modify storage bank:mob Costume.Legs set value {}
    execute unless data storage bank:mob Costume.Feet run data modify storage bank:mob Costume.Feet set value {}
    execute unless data storage bank:mob WeaponDropChances run data modify storage bank:mob WeaponDropChances set value [0f,0f]
    execute unless data storage bank:mob ArmorDropChances run data modify storage bank:mob ArmorDropChances set value [0f,0f,0f,0f]
    execute unless data storage bank:mob Health store result score @s MaxHP run data get storage bank:mob Status.HPMax
    execute unless data storage bank:mob Status.ATK run data modify storage bank:mob AttackDamage set value 0.01
    execute unless data storage bank:mob Defense run data modify storage bank:mob Defense set value 0
    #execute unless data storage bank:mob SpecialDefense run data modify storage bank:mob SpecialDefense set value 0
    # execute unless data storage bank:mob Speed run
    # execute unless data storage bank:mob FollowRange run
    execute unless data storage bank:mob KBResistance run data modify storage bank:mob KBResistance set value 0.75f
    #execute unless data storage bank:mob Resist.Physical run data modify storage bank:mob Resist.Physical set value 1f
    #execute unless data storage bank:mob Resist.Magic run data modify storage bank:mob Resist.Magic set value 1f
    #execute unless data storage bank:mob Resist.Fire run data modify storage bank:mob Resist.Fire set value 1f
    #execute unless data storage bank:mob Resist.Water run data modify storage bank:mob Resist.Water set value 1f
    #execute unless data storage bank:mob Resist.Thunder run data modify storage bank:mob Resist.Thunder set value 1f
    # execute unless data storage bank:mob Field run

# リリース時、負荷軽減のためツールでsummonコマンドに統合し削除する
    # 武器防具
        data modify storage bank:mob HandItems set value []
        data modify entity @s equipment.mainhand set from storage bank:mob Costume.Mainhand
        data modify entity @s equipment.offhand set from storage bank:mob Costume.Offhand
        data modify storage bank:mob HandItems[].tag.AttributeModifiers set value []
        data modify storage bank:mob ArmorItems set value []
        data modify entity @s equipment.feet set from storage bank:mob Costume.Feet
        data modify entity @s equipment.legs set from storage bank:mob Costume.Legs
        data modify entity @s equipment.chest set from storage bank:mob Costume.Chest
        data modify entity @s equipment.head set from storage bank:mob Costume.Head
        data modify storage bank:mob ArmorItems[].tag.AttributeModifiers set value []
    # ドロップチャンス
        # data modify entity @s HandDropChances set from storage bank:mob WeaponDropChances
        # data modify entity @s ArmorDropChances set from storage bank:mob ArmorDropChances

# レベル計算
# 基準レベル読み込み
    execute store result score @s LV_Base run data get storage bank:mob Status.Level

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
    execute store result score @s MaxHP run data get storage bank:mob Status.MaxHP
    scoreboard players operation @s MaxHP *= @s Factor
    scoreboard players operation @s MaxHP /= $100 Const
    scoreboard players operation @s HP = @s MaxHP

# STR
    execute store result score @s STR run data get storage bank:mob Status.ATK
    scoreboard players operation @s STR *= @s Factor
    scoreboard players operation @s STR /= $100 Const

# DEF
    execute store result score @s DEF run data get storage bank:mob Status.DEF
    scoreboard players operation @s DEF *= @s Factor
    scoreboard players operation @s DEF /= $100 Const

# AGI (移動速度は一旦そのまま)
    execute store result score @s AGI run data get storage bank:mob Status.SPD
    scoreboard players operation @s AGI *= @s Factor
    scoreboard players operation @s AGI /= $100 Const


# Gold
    execute store result score @s DropGold run data get storage bank:mob Status.GOLD
    scoreboard players operation @s DropGold *= @s Factor
    scoreboard players operation @s DropGold /= $100 Const

# 名前更新 (レベル表示追加)
# apply_nbt で CustomName が適用された後に実行する必要がある
# LVスコアをStorageに保存してマクロ呼び出し
    execute store result storage bank:mob lv int 1 run scoreboard players get @s LV
    data modify storage bank:mob CustomName set from storage bank:mob Base.CustomName
    function bank_manager:mob/summon/apply_status/level/ with storage bank_mob:


    # 体力 (e2)
        data modify entity @s Health set value 1024f
        effect give @s regeneration infinite 255 true
        #execute if data storage bank:mob {Type:"Enemy"} run function mob_manager:init/multiplay_multiplier/normal
        #execute if data storage bank:mob {Type:"Enemy.Boss"} run function mob_manager:init/multiplay_multiplier/angel
        #execute if data storage bank:mob {Type:"Enemy.EndGameBoss"} run function mob_manager:init/multiplay_multiplier/angel

# 名前表示
    data modify entity @s CustomNameVisible set value 1b
# タグ周り
    function bank_manager:mob/summon/apply_status/tag
# Enemyのチーム設定
    execute if data storage bank:mob {Type:"ENEMY"} run team join ENEMY

# EntityStorage呼び出し
    function oh_my_dat:please
# 属性耐性
    # Baseを追加
        # data modify storage bank:mob Resist.Base set value 1f
    # 適用
        # data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Attributes.Default.Defense set from storage bank:mob Resist
        # data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Attributes.Value.Defense set from storage bank:mob Resist
# フィールド
    #execute if data storage bank:mob FieldOverride run data modify storage bank:mob Field merge from storage bank:mob FieldOverride
    #data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].MobField set from storage bank:mob Field
# LoreをROMに書き込む
    #data modify storage api: Argument.Address set from storage bank:mob ID
    #function api:rom/please
    #data modify storage rom: _[-4][-4][-4][-4][-4][-4][-4][-4].Mob.Lore set from storage bank:mob Lore
# データ初期化
    function mob_manager:init/
# 統計データに放り込む
    #execute if entity @s[tag=Enemy.Boss] run function metric:angel/summon.m with storage bank:mob
# リセット
    data remove storage bank:mob ExtendsSafe
    data remove storage bank:mob IsAbstract
    data remove storage bank:mob Costume
    data remove storage bank:mob Attributes
    data remove storage bank:mob ID
    data remove storage bank:mob Type
    data remove storage bank:mob Interferable
    data remove storage bank:mob IsForwardTarget
    data remove storage bank:mob Name
    data remove storage bank:mob Lore
    data remove storage bank:mob Weapon
    data remove storage bank:mob WeaponDropChances
    data remove storage bank:mob Armor
    data remove storage bank:mob ArmorDropChances
    data remove storage bank:mob Health
    data remove storage bank:mob AttackDamage
    data remove storage bank:mob Defense
    data remove storage bank:mob SpecialDefense
    data remove storage bank:mob Speed
    data remove storage bank:mob FollowRange
    data remove storage bank:mob KnockBackResist
    data remove storage bank:mob Resist
    data remove storage bank:mob Field
    data remove storage bank:mob FieldOverride