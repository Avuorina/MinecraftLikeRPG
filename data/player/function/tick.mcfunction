# プレイヤーtick

## レベルアップチェック
    execute if score @s exp >= @s exp_next run function player:level/up

## HP
    execute as @a at @s run function player:status/hp/