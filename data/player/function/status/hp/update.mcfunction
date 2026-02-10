#> player:status/hp/update
#
#
#
# @within function player:status/apply_player

# --- HP表示 ---
# max_health は常に20（ハート10個）に固定
    #attribute @s minecraft:max_health base set 20

# HP割合計算: Heart = (hp/max_hp)*20
    scoreboard players operation @s _ = @s HP
    scoreboard players operation @s _ *= $10000 Const
    scoreboard players operation @s _ /= @s MaxHP
    scoreboard players operation @s _ *= $20 Const
    scoreboard players operation @s _ /= $10000 Const
    execute if score @s HP matches 1.. if score @s _ matches ..0 run scoreboard players set @s _ 1
    execute store result storage player: Health int 1 run scoreboard players get @s _

# 呼び出し
    function player:status/hp/bar with storage player:

# 回復
    effect give @s health_boost infinite 0 true
    effect clear @s health_boost
    effect give @s instant_health 1 1 true

# リセット
    scoreboard players reset @s _
    data remove storage player: Health