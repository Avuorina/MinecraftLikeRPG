# HPに関するtick

# 自然回復
    execute if score @s hp >= @s max_hp run scoreboard players operation @s hp = @s max_hp
    execute if score @s hp < @s max_hp run scoreboard players operation @s hpRTimer += @s hpRegen
    execute if score @s hpRTimer matches 2000.. run function player:status/hp/regen

# HPの計算処理
    function player:status/hp/update
