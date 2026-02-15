#> bank_manager:mob/spawn/set_spawner/each_mob
#
# モブの(計算の要らない)基本情報を、スポナーに反映させる。
#
# @within function bank_manager:mob/spawn/set_spawner/

# rpg_mob: MobTags から、モブを召喚させるためのタグを１セット取り出す
    data modify entity @s Tags set from storage rpg_mob: MobTags[-1].Tags

    #データを初期化
data remove storage rpg_mob: Instant
data remove storage rpg_mob: Delay

# 属性値デフォルト
#data modify storage rpg_mob: Delay."ステータス" set value {"炎属性値":100,"氷属性値":100,"雷属性値":100,"光属性値":100,"闇属性値":100}

# タグに応じて、データを取得する
    function bank:mob/

    #召喚時演出
    #execute if entity @s[tag=SpawnParticles] run function makeup:enemy/spawn

    #モブのレベルを引き継ぐ
execute if score _ LV_Base matches 1.. store result storage rpg_mob: MobTags[-1].Level int 1 run scoreboard players get _ LV

# rpg_mob: SpawnDataを初期化する
    data modify storage rpg_mob: SpawnData set value {Attributes:[{Name:"minecraft:generic.movement_speed"},{Name:"minecraft:generic.knockback_resistance"},{Name:"minecraft:generic.attack_knockback"}],Passengers:[]}

# OhMyDatIDを保存
    execute store result storage rpg_mob: SpawnData.TicksFrozen int 1 run scoreboard players get @s OhMyDatID

# 即時ステータスを反映させる
    data modify storage rpg_mob: SpawnData merge from storage rpg_mob: Instant.Base
    data modify storage rpg_mob: SpawnData merge from storage rpg_mob: Instant.Costume
    execute if data storage rpg_mob: SpawnData{Tags:[Enemy]} unless data storage rpg_mob: SpawnData.Team run data modify storage rpg_mob: SpawnData.Team set value "Enemy"
    execute if data storage rpg_mob: SpawnData{Team:"None"} run data remove storage rpg_mob: SpawnData.Team
    data modify storage rpg_mob: SpawnData.Attributes[{Name:"minecraft:generic.follow_range"}].Base set from storage rpg_mob: Instant.EyePower
    data modify storage rpg_mob: SpawnData.Attributes[{Name:"minecraft:generic.movement_speed"}].Base set from storage rpg_mob: Instant.MovementPower
    data modify storage rpg_mob: SpawnData.Attributes[{Name:"minecraft:generic.knockback_resistance"}].Base set from storage rpg_mob: Instant.KBResistance
    data modify storage rpg_mob: SpawnData.Attributes[{Name:"minecraft:generic.attack_knockback"}].Base set from storage rpg_mob: Instant.KBPower

# 遅延ステータスを保存する
    data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DelayedDataList append value {}
    data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DelayedDataList[-1].Level set from storage rpg_mob: MobTags[-1].Level
    data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DelayedDataList[-1].Delay set from storage rpg_mob: Delay
    execute unless data storage rpg_mob: Instant."ベース"{Tags:[DelayedData]} run data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DelayedDataList[-1]

# 自然湧き用処理
# tellraw @p [{"text":"LootTable: "},{"nbt":"","entity":"@s"}]
#execute if data storage rpg_mob: Extra{NaturalSpawn:1b} run function enemy:spawn/set_spawner/for_natural_spawn

# 親IDを保存する
    data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DelayedDataList[-1].ParentID set from storage rpg_mob: MobTags[-1].ParentID


### 上のモブをリストに追加する
    data modify storage rpg_mob: Passengers prepend from storage rpg_mob: SpawnData

### まだ読み込んでいないタグがあれば、繰り返す
    data remove storage rpg_mob: MobTags[-1]
    execute if data storage rpg_mob: MobTags[-1] run function bank_manager:mob/spawn/set_spawner/each_mob
