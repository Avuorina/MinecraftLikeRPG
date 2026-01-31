## スニークで+10 毎tick-1

# スニーク３回で実行
    execute if score @s SneakFrequency matches 20.. run function player:trigger/sneak/menu/open
    execute if score @s SneakFrequency matches 20.. run scoreboard players set @s SneakFrequency 1
    scoreboard players remove @s SneakFrequency 1