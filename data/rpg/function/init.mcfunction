# Minecraft RPG Datapack - 初期化
# ワールドロード時に実行される

# スコアボード作成
    scoreboard objectives add level dummy "Level"
    scoreboard objectives add exp dummy "Experience"
    scoreboard objectives add exp_next dummy "EXP to Next"
    scoreboard objectives add hp dummy "HP"
    scoreboard objectives add max_hp dummy "Max HP"
    scoreboard objectives add mp dummy "MP"
    scoreboard objectives add max_mp dummy "Max MP"
    scoreboard objectives add str dummy "Strength"
    scoreboard objectives add def dummy "Defense"
    scoreboard objectives add agi dummy "Agility"
    scoreboard objectives add int dummy "Intelligence"
    scoreboard objectives add spd dummy "Speed"
    scoreboard objectives add luck dummy "Luck"

# 内部用スコアボード
    scoreboard objectives add timer dummy
    scoreboard objectives add temp dummy
    scoreboard objectives add initialized dummy

# 討伐数カウント用
    scoreboard objectives add kills minecraft.custom:minecraft.mob_kills

# 計算用定数
    scoreboard players set #2 temp 2
    scoreboard players set #5 temp 5
    scoreboard players set #10 temp 10
    scoreboard players set #20 temp 20
    scoreboard players set #50 temp 50
    scoreboard players set #100 temp 100

tellraw @a {"text":"[RPG] データパックを初期化しました！","color":"green"}
