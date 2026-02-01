# スケルトン戦士 データ登録
# ID: 002.skeleton_warrior
# bank:mob/002.skeleton_warrior/register

# [Spawn Egg Command]
# give @p skeleton_spawn_egg[entity_data={id:"minecraft:armor_stand",NoGravity:1b,Invisible:1b,Tags:["mob.egg_spawn"],equipment:{head:{id:"minecraft:stone",count:1,components:{"minecraft:custom_data":{"RPGMobId":"002.skeleton_warrior"}}}}},item_name={"text":"スケルトン戦士 Spawn Egg","color":"gold"}] 1

# ベースエンティティ (summonに使うのでStorageへのベース保存は不要だが、参照用に残しても良い)
data modify storage rpg_mob: "ベース" set value {id:"minecraft:skeleton",Tags:[MOB,mob.002.skeleton_warrior,Init,Global,Ground,Shoot,Blow,SkeletonWarrior,ENEMY]}

# 見た目
# CustomName は JSON String として BaseNameJSON に保存する (動的レベル表示のため)
# ここで "見た目" からは除外し、個別の String Tag として保存
# ユーザー検証: シングルクォート無し (Compound Tag) で保存しても動く
data modify storage rpg_mob: BaseNameJSON set value {"color":"white","text":"スケルトン戦士"}

# 見た目 (CustomName以外)
data modify storage rpg_mob: "見た目" set value {}

# 装備 (初期化)
data modify storage rpg_mob: "見た目".ArmorItems set value [{},{},{},{}]
data modify storage rpg_mob: "見た目".HandItems set value [{},{}]

# 装備 (個別設定)
data modify storage rpg_mob: "見た目".ArmorItems[0] merge value {}
data modify storage rpg_mob: "見た目".ArmorItems[1] merge value {}
data modify storage rpg_mob: "見た目".ArmorItems[2] merge value {}
data modify storage rpg_mob: "見た目".ArmorItems[3] merge value {}

data modify storage rpg_mob: "見た目".HandItems[0] merge value {id:"minecraft:bow",Count:1b}
data modify storage rpg_mob: "見た目".HandItems[1] merge value {}

# ステータス
data modify storage rpg_mob: "レベル" set value 10
data modify storage rpg_mob: "最大HP" set value 80
data modify storage rpg_mob: "物理攻撃力" set value 15
data modify storage rpg_mob: "物理防御力" set value 10
data modify storage rpg_mob: "素早さ" set value 5
data modify storage rpg_mob: "運" set value 5

# AIパラメータ
data modify storage rpg_mob: ai_speed set value 0.5000
data modify storage rpg_mob: ai_follow_range set value 0.0000
data modify storage rpg_mob: ai_knockback_resistance set value 0

# 召喚 & セットアップ
# NBTは最低限 (Tags, CustomNameVisible, PersistenceRequired)
# 見た目やステータスは apply_from_storage で適用される
summon minecraft:skeleton ~ ~ ~ {Tags:[MOB,mob.002.skeleton_warrior,Init,Global,Ground,Shoot,Blow,SkeletonWarrior,ENEMY], CustomNameVisible:1b, PersistenceRequired:1b}

execute as @e[tag=mob.002.skeleton_warrior,tag=Init,distance=..1,limit=1] run function mob:setup/apply_from_storage
