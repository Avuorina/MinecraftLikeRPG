# プレイヤー初期セットアップ
# 新規プレイヤーに初期ステータスを設定

# 初期ステータス設定
scoreboard players set @s rpg.level 1
scoreboard players set @s rpg.exp 0
scoreboard players set @s rpg.exp_next 100

scoreboard players set @s rpg.max_hp 20
scoreboard players set @s rpg.hp 20
scoreboard players set @s rpg.max_mp 10
scoreboard players set @s rpg.mp 10

scoreboard players set @s rpg.str 5
scoreboard players set @s rpg.def 5
scoreboard players set @s rpg.agi 5

# 初期化済みフラグ
scoreboard players set @s rpg.initialized 1

tellraw @s [{"text":"[RPG] ","color":"gold"},{"text":"冒険へようこそ！","color":"white"}]
tellraw @s [{"text":"Level: ","color":"gray"},{"score":{"name":"@s","objective":"rpg.level"},"color":"yellow"}]
