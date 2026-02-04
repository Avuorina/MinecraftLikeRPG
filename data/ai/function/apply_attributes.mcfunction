#> ai:apply_attributes
#
# AI属性適用 (マクロ呼び出し元)
# storage rpg_mob: から値を読み取り、マクロを実行する
#
# @within function mob:setup/init



# 読み込む値:
# - ai.speed (移動速度)
# - ai.follow_range (索敵範囲)
# - ai.knockback_resistance (ノックバック耐性)

# マクロ実行
    function ai:apply_attributes_macro with storage rpg_mob:
