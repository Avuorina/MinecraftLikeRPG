#> skill:summon/check_safe_pos
#
# 現在位置が安全かどうかを判定する
# @s: SpreadTry マーカー

# 1. もし足が埋まっていたら、上に少し(最大3)ずらして探索
    execute at @s unless block ~ ~ ~ #minecraft:air run tp @s ~ ~1 ~
    execute at @s unless block ~ ~ ~ #minecraft:air run tp @s ~ ~1 ~
    execute at @s unless block ~ ~ ~ #minecraft:air run tp @s ~ ~1 ~

# 2. もし足元が空気なら、下に少し(最大5)ずらして探索
    execute at @s if block ~ ~-1 ~ #minecraft:air run tp @s ~ ~-1 ~
    execute at @s if block ~ ~-1 ~ #minecraft:air run tp @s ~ ~-1 ~
    execute at @s if block ~ ~-1 ~ #minecraft:air run tp @s ~ ~-1 ~
    execute at @s if block ~ ~-1 ~ #minecraft:air run tp @s ~ ~-1 ~
    execute at @s if block ~ ~-1 ~ #minecraft:air run tp @s ~ ~-1 ~

# 3. 最終チェック
# - 足元(~ ~-1 ~)が空気ではない (床がある)
# - 足・頭(~ ~ ~, ~ ~1 ~)が空気 (埋まっていない)
    execute at @s if predicate lib:safe_zone run scoreboard players set #spread_success _ 1
