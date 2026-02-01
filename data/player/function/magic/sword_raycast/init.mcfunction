# Raycast初期化
# StorageのRangeからループ回数を計算

# 1. Rangeを取得 (float -> int scaling)
# 0.5ブロック刻みなので、Range * 2 回ループする
    execute store result score @s RaycastCount run data get storage rpg_item: MainHand Range 2.0

# 2. ループ開始
    function player:magic/sword_raycast/loop
