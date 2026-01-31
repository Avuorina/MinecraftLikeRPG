# レベルアップ処理

# レベル+1
    scoreboard players add @s LV 1

# 経験値を消費
    scoreboard players operation @s EXP -= @s nextEXP

# 次のレベルに必要な経験値 = レベル * 50
    scoreboard players operation @s nextEXP = @s LV
    scoreboard players operation @s nextEXP *= 50 Const
    scoreboard players add @s nextEXP 2

# ステータスポイント配布
    scoreboard players add @s StatusPoint 3

# HP/MP全回復
    scoreboard players operation @s HP = @s MaxHP
    scoreboard players operation @s MP = @s MaxMP

# エフェクト
    playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1
    particle minecraft:totem_of_undying ~ ~1 ~ 0.5 1 0.5 0.1 50

# レベルアップ通知
    tellraw @s [{"text":"═══════════════════════════","color":"gold"}]
    tellraw @s [{"text":" ★ LEVEL UP! ★","color":"yellow","bold":true}]
    tellraw @s [{"text":" Level ","color":"gray"},{"score":{"name":"@s","objective":"LV"},"color":"yellow","bold":true}]
    tellraw @s [{"text":" MaxHP +2  MaxMP +1","color":"green"}]
    tellraw @s [{"text":" ALL STATS +1","color":"aqua"}]
    tellraw @s [{"text":"═══════════════════════════","color":"gold"}]

# 連続レベルアップチェック
    execute if score @s EXP >= @s nextEXP run function player:level/up
