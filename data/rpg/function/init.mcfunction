# Minecraft RPG Datapack - 初期化
# ワールドロード時に実行される

# スコアボード作成
scoreboard objectives add rpg.level dummy "Level"
scoreboard objectives add rpg.exp dummy "Experience"
scoreboard objectives add rpg.exp_next dummy "EXP to Next"
scoreboard objectives add rpg.hp dummy "HP"
scoreboard objectives add rpg.max_hp dummy "Max HP"
scoreboard objectives add rpg.mp dummy "MP"
scoreboard objectives add rpg.max_mp dummy "Max MP"
scoreboard objectives add rpg.str dummy "Strength"
scoreboard objectives add rpg.def dummy "Defense"
scoreboard objectives add rpg.agi dummy "Agility"

# 内部用スコアボード
scoreboard objectives add rpg.timer dummy
scoreboard objectives add rpg.temp dummy
scoreboard objectives add rpg.initialized dummy

tellraw @a {"text":"[RPG] データパックを初期化しました！","color":"green"}
