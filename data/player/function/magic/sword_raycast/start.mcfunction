# ソード攻撃のRaycast (始点)
# 実行者: プレイヤー (@s)

# 1. アイテム情報をロード (Storage rpg_item: MainHand に入る)
    function player:item/check_mainhand

# 2. ロードできた場合のみ実行 (Rangeがあるか確認)
    execute if data storage rpg_item: MainHand.Range run function player:magic/sword_raycast/init
