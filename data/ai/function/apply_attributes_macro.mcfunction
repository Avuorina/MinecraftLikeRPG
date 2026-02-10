#> ai:apply_attributes_macro
#
#
#
# @within function ai:apply_attributes

# AI属性適用 (マクロ本体)
# 引数: $(ai_speed), $(ai_follow_range), $(ai_knockback_resistance)

# 1. 移動速度 (Speed) - 倍率加算 (add_multiplied_base)
# $(ai_speed) は "入力値 - 1.0" (例: 1.2倍なら 0.2)
    $attribute @s minecraft:movement_speed modifier add rpg:ai_speed "AI Speed" $(ai_speed) add_multiplied_base

# 2. 索敵範囲 (Follow Range) - 倍率加算 (add_multiplied_base)
    $attribute @s minecraft:follow_range modifier add rpg:ai_follow_range "AI Follow Range" $(ai_follow_range) add_multiplied_base

# 3. ノックバック耐性 (KB Resist) - 固定値加算 (add)
# 多くのMOBはベース0なので、base setでもaddでもいいが、防具などを考慮して add にする（あるいは base set のままにするか？）
# ここでは "耐性値" そのものを指定する運用のようなので base set を維持（あるいは add で加算）
# ユーザー要望は「数値」なので 0.5 とか。 base set のほうが確実か。
# しかし、装備のKB耐性が消える可能性がある。
# とはいえ、MOB定義でKB耐性指定するならそれが正な気がする。
# 一旦 base set を modifier add ... add_value に変えるのが行儀が良い。
    $attribute @s minecraft:knockback_resistance modifier add rpg:ai_kb_resist "AI KB Resist" $(ai_knockback_resistance) add_value
