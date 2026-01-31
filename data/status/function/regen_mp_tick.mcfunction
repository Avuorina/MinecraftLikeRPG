# MP回復tick処理
    scoreboard players set @s Timer 0
    execute if score @s MP < @s MaxMP run scoreboard players add @s MP 1
