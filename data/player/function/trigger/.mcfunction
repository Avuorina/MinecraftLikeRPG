## トリガーをtickする

# スニークメニュー
    execute if score @s SneakTimer matches 1.. run function player:trigger/sneak/
    execute if score @s SneakFrequency matches 1.. run function player:trigger/sneak/frequency
        # メニュー操作
            execute if score @s Menu matches 1.. run function player:trigger/sneak/menu/sort
            