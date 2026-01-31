# ソートする

# 音
    execute at @s run playsound ui.button.click master @s ~ ~ ~ 1 2

# ステータス画面[1]
    execute if score @s Menu matches 1 run function player:status/allocation_screen

# カテゴリ選択[101-199]
    execute if score @s Menu matches 101..199 run function player:trigger/sneak/menu/run/status
## リセット
    scoreboard players set @s Menu 0