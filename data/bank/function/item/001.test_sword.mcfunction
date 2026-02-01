# テスト用：木の剣（中身は最強）
# ID: 001.test_sword

# 攻撃範囲 (ブロック)
    data modify storage rpg_item: MainHand set value {Range:3.0f}

# 攻撃力
    data modify storage rpg_item: MainHand merge value {Attack:7}

# 追加効果など (将来的に拡張可能)
# data modify storage rpg_item: MainHand merge value {Effect:"fire", EffectLevel:1}
