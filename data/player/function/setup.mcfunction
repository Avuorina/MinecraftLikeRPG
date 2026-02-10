# プレイヤー初期セットアップ
# 新規プレイヤーに初期ステータスを設定

# 初期ステータス設定
    scoreboard players set @s LV 1
    scoreboard players set @s EXP 0
    scoreboard players set @s nextEXP 7

scoreboard players set @s MaxHP 20
scoreboard players set @s HP 20
scoreboard players set @s HPRegen 10
scoreboard players set @s MaxMP 1
scoreboard players set @s MP 1

scoreboard players set @s STR 2
scoreboard players set @s DEF 1
scoreboard players set @s AGI 1
scoreboard players set @s INT 1
scoreboard players set @s SPD 1
scoreboard players set @s LUCK 1
scoreboard players set @s Progress 1
scoreboard players set @s StatusPoint 0
scoreboard players set @s GOLD 20

# 進行度も計算し直し
    scoreboard players operation $lv _ = @s LV
    scoreboard players operation $lv _ %= $10 Const
# 個体進行度＋１
    execute if score @s LV matches 10.. if score $lv _ matches 0 run scoreboard players add @s Progress 1
    execute as @a run scoreboard players add $PlayerCount _ 1
    execute as @a run scoreboard players operation $Tortal Progress += @s Progress
    scoreboard players operation $Tortal Progress /= $PlayerCount _
    scoreboard players operation $Global Progress = $Tortal Progress

# 初期補正
    function player:status/atk/update

# 初期化済みフラグ
    scoreboard players set @s Initialized 1

tellraw @s [{"text":"[RPG] ","color":"gold"},{"text":"冒険へようこそ！","color":"white"}]
tellraw @s [{"text":"Level: ","color":"gray"},{"score":{"name":"@s","objective":"LV"},"color":"yellow"}]

# Reset
    scoreboard players reset $lv _
    scoreboard players reset $Tortal Progress
    scoreboard players reset $PlayerCount _