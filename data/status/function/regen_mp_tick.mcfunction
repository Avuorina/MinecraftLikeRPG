# MP回復tick処理
    scoreboard players set @s timer 0
    execute if score @s mp < @s max_mp run scoreboard players add @s mp 1
