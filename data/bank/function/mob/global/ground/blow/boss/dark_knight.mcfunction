# ダークナイト 設定
# bank:mob/global/ground/blow/boss/dark_knight

# [Spawn Egg Command]
# give @p zombie_spawn_egg[entity_data={id:"minecraft:armor_stand",NoGravity:1b,Invisible:1b,Tags:["mob.egg_spawn"],equipment:{head:{id:"minecraft:stone",count:1,components:{"minecraft:custom_data":{"RPGMobId":"dark_knight"}}}}},item_name={"text":"ダークナイト Spawn Egg","color":"gold"}] 1

# ベースエンティティ（即時ステータス）
data modify storage rpg_mob: ベース set value {id:"minecraft:wither_skeleton",Tags:[MOB,mob.dark_knight,mob.new,mob.boss,Global,Ground,BOSS,DarkKnight]}

# 見た目
data modify storage rpg_mob: 見た目 set value {CustomName:[{"color":"dark_red","text":"☠"},{"bold":true,"color":"dark_purple","text":"ダークナイト"},{"bold":false,"color":"gray","text":"Lv.30"}],mainhand:{id:"minecraft:netherite_sword",count:1}}

# ステータス
data modify storage rpg_mob: レベル set value 30
data modify storage rpg_mob: 最大HP set value 500
data modify storage rpg_mob: 物理攻撃力 set value 50
data modify storage rpg_mob: 物理防御力 set value 30
data modify storage rpg_mob: 素早さ set value 10
data modify storage rpg_mob: 運 set value 10

# ボスフラグ
data modify storage rpg_mob: ボス set value true
