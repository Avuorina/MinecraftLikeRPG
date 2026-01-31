## スニークしたら実行されるよ

# スニーク回数取得
    execute if score @s SneakTimer matches 1 run scoreboard players add @s SneakFrequency 10

# 初期化
    scoreboard players set _ _ 4
    scoreboard players operation @s SneakTimer *= _ _
    scoreboard players set _ _ 8
    scoreboard players operation @s SneakTimer %= _ _
    scoreboard players reset _ _