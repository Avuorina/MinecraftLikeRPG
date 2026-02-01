# 攻撃ヒット処理 (マクロ)
# 実行者: 敵 (@s)
# 攻撃者: 近くのプレイヤー (@p) と仮定（厳密にはRaycast開始時にタグ付け推奨）

# Attack値をStorageから取得してマクロ実行
# マクロ機能を使うため、Storageの値をそのまま引数にする
    function player:magic/sword_raycast/hit_apply with storage rpg_item: MainHand
