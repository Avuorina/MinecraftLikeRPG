# 攻撃力反映（マクロ）
# 引数: $(calc) = 倍率 (例: 0.5 なら 1.5倍)

# 既存の補正を削除
    attribute @s minecraft:attack_damage modifier remove rpg:str_bonus

# 新しい補正を付与 (multiply_total)
# バニラ攻撃力(武器含む) * (1 + STR/100)
    $attribute @s minecraft:attack_damage modifier add rpg:str_bonus $(calc) add_multiplied_total

# 最終的な攻撃力をスコアに保存 (ATK)
    execute store result score @s ATK run attribute @s minecraft:attack_damage get
