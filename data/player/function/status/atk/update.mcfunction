# 攻撃力計算 (STR比例)
# 倍率 = STR * 0.01 (例: STR 50 -> 0.5 -> 1.5倍ダメージ)

# 計算
    execute store result storage player: calc double 0.01 run scoreboard players get @s STR

# マクロ呼び出し
    function player:status/atk/macro with storage player:
