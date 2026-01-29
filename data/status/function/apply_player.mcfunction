# ステータス適用（プレイヤー用）
# スコアボードの値をMinecraftのAttributeに反映
# @sとして実行される

# --- HP表示 ---
# max_health は常に20（ハート10個）に固定
    attribute @s minecraft:max_health base set 20
    execute if score @s hp > @s max_hp run scoreboard players operation @s hp = @s max_hp

# HP割合計算: temp = HP * 20 / MaxHP
    scoreboard players operation @s temp = @s hp
    scoreboard players operation @s temp *= #20 temp
    scoreboard players operation @s temp /= @s max_hp
    execute if score @s hp matches 1.. if score @s temp matches ..0 run scoreboard players set @s temp 1
    execute store result entity @s Health float 1 run scoreboard players get @s temp

# --- 攻撃力適用 ---
# str を攻撃力に変換（STR / 5 = 攻撃力、STR 5 = 1ダメージ）
    execute store result entity @s attribute.minecraft:attack_damage.base double 0.2 run scoreboard players get @s str

# --- 防御力適用 ---
# def を装甲値に変換（DEF - 5 = 装甲、DEF 5 = 0装甲）
    scoreboard players operation @s temp = @s def
    scoreboard players remove @s temp 5
    execute if score @s temp matches 0.. store result entity @s attribute.minecraft:armor.base double 1 run scoreboard players get @s temp
    execute if score @s temp matches ..-1 run attribute @s minecraft:armor base set 0

# --- 俊敏性適用 ---
# agi を移動速度に変換（AGI 5 = 0.1）
    scoreboard players operation @s temp = @s agi
    scoreboard players operation @s temp *= #2 temp
    scoreboard players add @s temp 90
    execute store result entity @s attribute.minecraft:movement_speed.base double 0.001 run scoreboard players get @s temp

# --- 攻撃速度適用 (SPD) ---
# spd を攻撃速度に変換（デフォルト4.0, SPD 5 = 4.0）
# SPD +1 = +0.1 speed
    scoreboard players operation @s temp = @s spd
    scoreboard players remove @s temp 5
    execute store result storage rpg:temp spd_bonus double 0.1 run scoreboard players get @s temp
    execute store result entity @s attribute.minecraft:attack_speed.base double 1 run scoreboard players get @s spd
    # ↑簡単な式にするため、SPD / 5 * 4.0 にする？いや、単純加算がいい。
    # Baseを4.0として、(SPD - 5) * 0.1 を加算したいが、base setしかできないので
    # 4.0 + (SPD - 5) * 0.1
    # = 3.5 + SPD * 0.1
        scoreboard players operation @s temp = @s spd
        scoreboard players add @s temp 35
        execute store result entity @s attribute.minecraft:attack_speed.base double 0.1 run scoreboard players get @s temp

    # --- 幸運適用 (LUCK) ---
    # luck を幸運値に変換（LUCK - 5 = luck）
    # LUCK 5 = 0, LUCK 10 = +5
        scoreboard players operation @s temp = @s luck
        scoreboard players remove @s temp 5
        execute store result entity @s attribute.minecraft:luck.base double 1 run scoreboard players get @s temp
