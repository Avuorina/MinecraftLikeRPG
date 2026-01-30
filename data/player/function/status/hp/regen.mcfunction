# HP自動回復
    scoreboard players add @s hp 1
# タイマーから消費（リセットではなく引くことで、余剰分を無駄にしない）
    scoreboard players remove @s hpRTimer 2000
# もしまだ余ってたら再帰的に呼ぶ（超高速回復のサポート）
    execute if score @s hpRTimer matches 2000.. run function player:status/hp/regen