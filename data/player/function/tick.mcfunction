# プレイヤーtick

## レベルアップチェック
    execute if score @s EXP >= @s nextEXP run function player:level/up/

## HP
    execute at @s run function player:status/hp/

## スニーク検知
    execute at @s run function player:trigger/

## 入力検知 (実装難易度が高いため未実装)
#execute as @a at @s run function player:input/tick

# execute if score @s DamageTaken matches 1.. run function player:on_damage
