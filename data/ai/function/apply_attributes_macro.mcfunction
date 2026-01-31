# AI属性適用 (マクロ本体)
# 引数: $(ai.speed), $(ai.follow_range), $(ai.knockback_resistance)

# default値を設定 (もしstorageにない場合のエラー回避のため、本来は呼び出し元でマージすべきだが、簡易的にチェック)
# ここではデータが存在すること前提でマクロ展開する

# 1. 移動速度 (Speed)
    $attribute @s minecraft:generic.movement_speed base set $(ai_speed)

# 2. 索敵範囲 (Follow Range)
    $attribute @s minecraft:generic.follow_range base set $(ai_follow_range)

# 3. ノックバック耐性 (KB Resist)
    $attribute @s minecraft:generic.knockback_resistance base set $(ai_knockback_resistance)
