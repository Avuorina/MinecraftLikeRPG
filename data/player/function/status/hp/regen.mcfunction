# HP自動回復
    scoreboard players add @s HP 1
# タイマーから消費（リセットではなく引くことで、余剰分を無駄にしない）
    scoreboard players remove @s HPRegenTimer 2000
# アップデート
    function player:status/hp/update
# もしまだ余ってたら再帰的に呼ぶ（超高速回復のサポート）
    execute if score @s HPRegenTimer matches 2000.. run function player:status/hp/regen