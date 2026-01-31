# プレイヤー初期セットアップ
# 新規プレイヤーに初期ステータスを設定

# 初期ステータス設定
    scoreboard players set @s LV 1
    scoreboard players set @s EXP 0
    scoreboard players set @s nextEXP 100

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

# 初期化済みフラグ
    scoreboard players set @s Initialized 1

tellraw @s [{"text":"[RPG] ","color":"gold"},{"text":"冒険へようこそ！","color":"white"}]
tellraw @s [{"text":"Level: ","color":"gray"},{"score":{"name":"@s","objective":"LV"},"color":"yellow"}]
