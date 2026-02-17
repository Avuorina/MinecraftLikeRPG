#> player:status/hp/update
#
#
#
# @within function player:status/apply_player

# --- HP表示 ---
# max_health は常に20（ハート10個）に固定
    #attribute @s minecraft:max_health base set 20

# HP割合計算: Heart = (hp/max_hp)*20
    scoreboard players operation @s HPRatio = @s HP
    scoreboard players operation @s HPRatio *= $10000 Const
    scoreboard players operation @s HPRatio /= @s MaxHP
    scoreboard players operation @s HPRatio *= $20 Const
    scoreboard players operation @s HPRatio /= $10000 Const
    execute if score @s HP matches 1.. if score @s HPRatio matches ..0 run scoreboard players set @s HPRatio 1
    execute store result storage player: Health int 1 run scoreboard players get @s HPRatio

# 呼び出し
    function player:status/hp/bar with storage player:

# 回復
    effect give @s health_boost infinite 0 true
    effect clear @s health_boost
    effect give @s instant_health 1 1 true

# リセット
    data remove storage player: Health
    say 1