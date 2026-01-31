# ステータスリセット
    scoreboard players reset @s Initialized
    function player:setup
    tellraw @s [{"text":"[DEBUG] ","color":"gray"},{"text":"ステータスをリセットしました","color":"yellow"}]
