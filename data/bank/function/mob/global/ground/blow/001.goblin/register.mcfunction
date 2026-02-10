# テストゴブリン データ登録
# ID: 001.goblin
# bank:mob/global/ground/blow/001.goblin/register

# [Spawn Egg Command]
# give @p zombie_spawn_egg[entity_data={id:"minecraft:armor_stand",NoGravity:1b,Invisible:1b,Tags:["mob.egg_spawn"],equipment:{head:{id:"minecraft:stone",count:1,components:{"minecraft:custom_data":{"RPGMobId":"001.goblin"}}}}},item_name={"text":"テストゴブリン Spawn Egg","color":"gold"}] 1

# ベースエンティティ (summonに使うのでStorageへのベース保存は不要だが、参照用に残しても良い)
data modify storage rpg_mob: "ベース" set value {id:"minecraft:zombie",Tags:[mob.001.goblin,Init,Global,Ground,Blow,Goblin,ENEMY]}

# 見た目
# CustomName は JSON String として BaseNameJSON に保存する (動的レベル表示のため)
# ここで "見た目" からは除外し、個別の String Tag として保存
# ユーザー検証: シングルクォート無し (Compound Tag) で保存しても動く
data modify storage rpg_mob: BaseNameJSON set value {"color":"green","text":"ゴブリン"}

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

data modify storage rpg_mob: "見た目".HandItems[0] merge value {}
data modify storage rpg_mob: "見た目".HandItems[1] merge value {}

# ステータス
data modify storage rpg_mob: "レベル" set value 1
data modify storage rpg_mob: "最大HP" set value 20
data modify storage rpg_mob: "物理攻撃力" set value 10
data modify storage rpg_mob: "物理防御力" set value 5
data modify storage rpg_mob: "素早さ" set value 7
data modify storage rpg_mob: "ドロップゴールド" set value 1

# AIパラメータ
data modify storage rpg_mob: ai_speed set value 0.0000
data modify storage rpg_mob: ai_follow_range set value 0.0000
data modify storage rpg_mob: ai_knockback_resistance set value 0

# 召喚 & セットアップ
# 召喚は mob:spawn/from_storage 側で実行されるため、ここではデータ定義のみ行う
# (registerからは summon しない)
