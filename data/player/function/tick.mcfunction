# プレイヤーtick

## レベルアップチェック
    execute if score @s EXP >= @s nextEXP run function player:level/up/

## HP
    execute at @s run function player:status/hp/

## スニーク検知
    execute at @s run function player:trigger/

## 入力検知 (Action/Left Click)
    execute at @s run function player:input/tick
