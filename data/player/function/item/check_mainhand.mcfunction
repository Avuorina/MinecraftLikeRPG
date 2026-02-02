# メインハンドのアイテムを確認してスペックをロードする
# 実行者: プレイヤー

# リセット
    data remove storage rpg_item: MainHand

# 1. 木の剣 -> テスト用データ (001.test_sword)
    execute if items entity @s weapon.mainhand wooden_sword run function bank:item/001.test_sword

# 他の剣も追加可能...
# execute if entity @s[nbt={SelectedItem:{id:"minecraft:iron_sword"}}] run function bank:item/002.iron_sword
