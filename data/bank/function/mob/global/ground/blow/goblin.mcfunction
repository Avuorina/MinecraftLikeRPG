# テストゴブリン 設定
# bank:mob/global/ground/blow/goblin

# [Spawn Egg Command]
# give @p zombie_spawn_egg[entity_data={id:"minecraft:armor_stand",NoGravity:1b,Invisible:1b,Tags:["mob.egg_spawn"],equipment:{head:{id:"minecraft:stone",count:1,components:{"minecraft:custom_data":{"RPGMobId":"goblin"}}}}},item_name={"text":"テストゴブリン Spawn Egg","color":"gold"}] 1

# ベースエンティティ（即時ステータス）
data modify storage rpg_mob: ベース set value {id:"minecraft:zombie",Tags:[MOB,mob.goblin,mob.new,Global,Ground,Blow,Goblin]}

# 見た目
data modify storage rpg_mob: 見た目 set value {CustomName:[{"color":"green","text":"ゴブリン"},{"color":"gray","text":"Lv5"}]}

# ステータス
data modify storage rpg_mob: レベル set value 5
data modify storage rpg_mob: 最大HP set value 50
data modify storage rpg_mob: 物理攻撃力 set value 10
data modify storage rpg_mob: 物理防御力 set value 5
data modify storage rpg_mob: 素早さ set value 7
data modify storage rpg_mob: 運 set value 3