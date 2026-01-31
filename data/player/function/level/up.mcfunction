# レベルアップ処理

# レベル+1
    scoreboard players add @s LV 1

# 経験値を消費
    scoreboard players operation @s EXP -= @s nextEXP

# バニラの必要経験値を参照
    # lv0 - lv15(2* LV +7)
        execute if score @s LV matches 0..15 run scoreboard players operation @s nextEXP = @s LV
        execute if score @s LV matches 0..15 run scoreboard players operation @s nextEXP *= $2 Const
        execute if score @s LV matches 0..15 run scoreboard players add @s nextEXP 7
    # lv16 - lv30(5* LV - 38)
        execute if score @s LV matches 16..30 run scoreboard players operation @s nextEXP = @s LV
        execute if score @s LV matches 16..30 run scoreboard players operation @s nextEXP *= $5 Const
        execute if score @s LV matches 16..30 run scoreboard players remove @s nextEXP 38
    # lv31 - lv60(10* LV - 158)
        execute if score @s LV matches 31..60 run scoreboard players operation @s nextEXP = @s LV
        execute if score @s LV matches 31..60 run scoreboard players operation @s nextEXP *= $10 Const
        execute if score @s LV matches 31..60 run scoreboard players remove @s nextEXP 158
    # lv61 - lv100(20* LV - 458)
        execute if score @s LV matches 61..100 run scoreboard players operation @s nextEXP = @s LV
        execute if score @s LV matches 61..100 run scoreboard players operation @s nextEXP *= $20 Const
        execute if score @s LV matches 61..100 run scoreboard players remove @s nextEXP 458

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
