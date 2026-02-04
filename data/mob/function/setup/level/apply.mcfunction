#> mob:setup/level/apply
#
#
#
# @within function mob:setup/level/

# レベル表示の適用 (マクロ)
# 実行者: モブ (@s)
# マクロ引数:
# - BaseNameJSON: ベース名のJSON文字列（例: {"text":"Goblin", "color":"green"}）
# - LevelJSON: レベル表記のJSON文字列（例: {"text":" Lv.5", "color":"gray"}）

# JSON配列文字列 '[...]' を構築して CustomName (String Tag) にセットする
# これにより、Entity側は正常なJSONとしてパースできる
    $data modify entity @s CustomName set value [$(BaseNameJSON), $(LevelJSON)]
