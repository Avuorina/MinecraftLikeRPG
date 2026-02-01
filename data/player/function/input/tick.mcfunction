# 左クリック検知処理 (毎tick実行) - マルチプレイ対応版
# 実行者: プレイヤー (@s)

# 0. スコアボード初期化 (初回のみ)
scoreboard objectives add inputUUID dummy

# 1. 自分のスコアが未設定なら Interaction Entity を作成
execute unless score @s inputUUID matches 1.. run function player:input/init

# 2. 多段階ブロック検知 (至近距離の壁抜け防止)
# 0.5, 1, 2, 3ブロック先を順にチェック
tag @s remove looking_at_block
execute anchored eyes positioned ^ ^ ^0.5 unless block ~ ~ ~ air run tag @s add looking_at_block
execute anchored eyes positioned ^ ^ ^1.0 unless block ~ ~ ~ air run tag @s add looking_at_block
execute anchored eyes positioned ^ ^ ^2.0 unless block ~ ~ ~ air run tag @s add looking_at_block
execute anchored eyes positioned ^ ^ ^3.0 unless block ~ ~ ~ air run tag @s add looking_at_block

# 3. 自分のUUIDとマッチするEntityをテレポート
# 3a. 全交互作用エンティティのスコアを更新
execute as @e[type=interaction,tag=input.click] store result score @s inputUUID run data get entity @s UUID[0]

# 3b. ブロックを見ていない場合: プレイヤーの位置(頭部)にテレポート
execute if entity @s[tag=!looking_at_block] at @s as @e[type=interaction,tag=input.click] if score @s inputUUID = @p inputUUID run tp @s ~ ~1 ~ ~ ~

# 3c. ブロックを見ている場合: 遠くに退避してアクションを邪魔しないようにする
execute if entity @s[tag=looking_at_block] at @s as @e[type=interaction,tag=input.click] if score @s inputUUID = @p inputUUID run tp @s ~ ~10 ~ ~ ~

# 4. 殴られたかチェック (自分のEntityのみ)
execute as @e[type=interaction,tag=input.click] if score @s inputUUID = @p inputUUID if data entity @s attack run function player:input/check_hit
