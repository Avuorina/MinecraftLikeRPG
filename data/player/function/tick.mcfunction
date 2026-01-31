# プレイヤーtick

## レベルアップチェック
    execute as @a if score @s EXP >= @s nextEXP run function player:level/up

## HP
    execute as @a at @s run function player:status/hp/

## スニーク検知
    execute as @a at @s run function player:trigger/