# ステータスリセット
    scoreboard players reset @s initialized
    function player:setup
    tellraw @s [{"text":"[DEBUG] ","color":"gray"},{"text":"ステータスをリセットしました","color":"yellow"}]
