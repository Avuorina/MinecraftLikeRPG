# 木の剣
# ID: 001.wodden_sword
# bank:item/001.wodden_sword/register

# 基本データ
data modify storage rpg_item: id set value "minecraft:wooden_sword"
data modify storage rpg_item: components set value {}
data modify storage rpg_item: count set value 1

# 表示名 & Lore
data modify storage rpg_item: components."minecraft:custom_name" set value '{"text":"木の剣","italic":false}'
data modify storage rpg_item: components."minecraft:lore" set value [{"text":"ちょっと成長してる木の剣","color":"gray"}]

# CustomModelData
data modify storage rpg_item: components."minecraft:custom_model_data" set value {floats:[1]}

# 識別用タグ
data modify storage rpg_item: components."minecraft:custom_data".RPGItem.ID set value "001.wodden_sword"

# --- ステータス設定 (RPG計算用) ---
data modify storage rpg_item: stats.ATK set value 0.0
data modify storage rpg_item: stats.HP set value 2.0
data modify storage rpg_item: stats.MP set value 0.0
data modify storage rpg_item: stats.STR set value 0.0
data modify storage rpg_item: stats.DEF set value 0.0
data modify storage rpg_item: stats.INT set value 0.0
data modify storage rpg_item: stats.AGI set value 0.0
data modify storage rpg_item: stats.LUCK set value 0.0

# その他 (Vanilla属性など)
data modify storage rpg_item: stats.VanillaATK set value 4.0
data modify storage rpg_item: stats.Range set value 2.0
data modify storage rpg_item: stats.Speed set value 1.6

# 保存: rpg_item:bank の中に保存
data modify storage rpg_item:bank 001.wodden_sword set from storage rpg_item:

# [Give Command Example]
# give @s minecraft:wooden_sword[custom_name='{"text":"木の剣","italic":false}',custom_model_data={floats:[1]},custom_data={RPGItem:{ID:"001.wodden_sword"}}]
