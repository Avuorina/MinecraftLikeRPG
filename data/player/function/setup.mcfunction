# プレイヤー初期セットアップ
# 新規プレイヤーに初期ステータスを設定

# 初期ステータス設定
    scoreboard players set @s level 1
    scoreboard players set @s exp 0
    scoreboard players set @s exp_next 100

scoreboard players set @s max_hp 20
scoreboard players set @s hp 20
scoreboard players set @s max_mp 10
scoreboard players set @s mp 10

scoreboard players set @s str 5
scoreboard players set @s def 5
scoreboard players set @s agi 5
scoreboard players set @s int 5
scoreboard players set @s spd 5
scoreboard players set @s luck 5

# 初期化済みフラグ
    scoreboard players set @s initialized 1

tellraw @s [{"text":"[RPG] ","color":"gold"},{"text":"冒険へようこそ！","color":"white"}]
tellraw @s [{"text":"Level: ","color":"gray"},{"score":{"name":"@s","objective":"level"},"color":"yellow"}]
