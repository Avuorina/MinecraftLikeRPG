# プレイヤーtick

## レベルアップチェック
    execute if score @s EXP >= @s nextEXP run function player:level/up/

## ステータス適用
    execute at @s run function player:status/apply_player

## スニーク検知
    execute at @s run function player:trigger/

## 左クリック検知
    execute as @a at @s run function player:attack/tick
