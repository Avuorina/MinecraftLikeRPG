# 攻撃力反映（マクロ）
# 引数: $(calc) = 追加攻撃力 (add_value)
# 引数: $(speed) = 攻撃速度補正 (add_value)

# 既存の補正を削除
    attribute @s minecraft:attack_damage modifier remove rpg:str_bonus
    attribute @s minecraft:attack_speed modifier remove rpg:speed_fix
    
# 攻撃速度反映
    $attribute @s minecraft:attack_speed modifier add rpg:speed_fix $(speed) add_value