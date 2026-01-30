# レベルアップ処理

# レベル+1
    scoreboard players add @s level 1

# 経験値を消費
    scoreboard players operation @s exp -= @s exp_next

# 次のレベルに必要な経験値 = レベル * 50 + 50
    scoreboard players operation @s exp_next = @s level
    scoreboard players operation @s exp_next *= $50 Const
    scoreboard players add @s exp_next 50

# ステータス上昇
    scoreboard players add @s max_hp 2
    scoreboard players add @s max_mp 1
    scoreboard players add @s str 1
    scoreboard players add @s def 1
    scoreboard players add @s agi 1
    scoreboard players add @s int 1
    scoreboard players add @s spd 1
    scoreboard players add @s luck 1

# HP/MP全回復
    scoreboard players operation @s hp = @s max_hp
    scoreboard players operation @s mp = @s max_mp

# エフェクト
    playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1
    particle minecraft:totem_of_undying ~ ~1 ~ 0.5 1 0.5 0.1 50

# レベルアップ通知
    tellraw @s [{"text":"═══════════════════════════","color":"gold"}]
    tellraw @s [{"text":" ★ LEVEL UP! ★","color":"yellow","bold":true}]
    tellraw @s [{"text":" Level ","color":"gray"},{"score":{"name":"@s","objective":"level"},"color":"yellow","bold":true}]
    tellraw @s [{"text":" MaxHP +2  MaxMP +1","color":"green"}]
    tellraw @s [{"text":" ALL STATS +1","color":"aqua"}]
    tellraw @s [{"text":"═══════════════════════════","color":"gold"}]

# 連続レベルアップチェック
    execute if score @s exp >= @s exp_next run function player:level/up
