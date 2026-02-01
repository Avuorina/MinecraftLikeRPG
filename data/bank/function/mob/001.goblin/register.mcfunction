# テストゴブリン データ登録
# ID: 001.goblin
# bank:mob/001.goblin/register

# [Spawn Egg Command]
# give @p zombie_spawn_egg[entity_data={id:"minecraft:armor_stand",NoGravity:1b,Invisible:1b,Tags:["mob.egg_spawn"],equipment:{head:{id:"minecraft:stone",count:1,components:{"minecraft:custom_data":{"RPGMobId":"001.goblin"}}}}},item_name={"text":"テストゴブリン Spawn Egg","color":"gold"}] 1

# ベースエンティティ (summonに使うのでStorageへのベース保存は不要だが、参照用に残しても良い)
data modify storage rpg_mob: "ベース" set value {id:"minecraft:zombie",Tags:[MOB,mob.001.goblin,Init,Global,Ground,Blow,Goblin]}

# 見た目
data modify storage rpg_mob: "見た目" set value {CustomName:[{"color":"green","text":"ゴブリン"},{"color":"gray","text":"Lv5"}]}

# 装備 (初期化)
data modify storage rpg_mob: "見た目".ArmorItems set value [{},{},{},{}]
data modify storage rpg_mob: "見た目".HandItems set value [{},{}]

# 装備 (個別設定)
data modify storage rpg_mob: "見た目".ArmorItems[0] merge value {}
data modify storage rpg_mob: "見た目".ArmorItems[1] merge value {}
data modify storage rpg_mob: "見た目".ArmorItems[2] merge value {}
data modify storage rpg_mob: "見た目".ArmorItems[3] merge value {}

data modify storage rpg_mob: "見た目".HandItems[0] merge value {}
data modify storage rpg_mob: "見た目".HandItems[1] merge value {}

# ステータス
data modify storage rpg_mob: "レベル" set value 5
data modify storage rpg_mob: "最大HP" set value 50
data modify storage rpg_mob: "物理攻撃力" set value 10
data modify storage rpg_mob: "物理防御力" set value 5
data modify storage rpg_mob: "素早さ" set value 7
data modify storage rpg_mob: "運" set value 3

# AIパラメータ
data modify storage rpg_mob: ai_speed set value 0.0000
data modify storage rpg_mob: ai_follow_range set value 0.0000
data modify storage rpg_mob: ai_knockback_resistance set value 0

# 召喚 & セットアップ
# NBTは最低限 (Tags, CustomNameVisible, PersistenceRequired)
# 見た目やステータスは apply_from_storage で適用される
summon minecraft:zombie ~ ~ ~ {Tags:[MOB,mob.001.goblin,Init,Global,Ground,Blow,Goblin], CustomNameVisible:1b, PersistenceRequired:1b}

execute as @e[tag=mob.001.goblin,tag=Init,distance=..1,limit=1] run function mob:setup/apply_from_storage
