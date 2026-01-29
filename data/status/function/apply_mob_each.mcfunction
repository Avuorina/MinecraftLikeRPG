# MOB用ステータス適用（個体処理）
# @s として実行される
# 必要なスコア: max_hp, str, def, agi, luck, temp

# --- MaxHP ---
# max_hp スコアをそのままAttributeに適用
# 0以下の場合は適用しない（安全策）
    execute if score @s max_hp matches 1.. store result entity @s attribute.minecraft:max_health.base double 1 run scoreboard players get @s max_hp

# --- 攻撃力 (STR) ---
# STR * 0.2
    execute store result entity @s attribute.minecraft:attack_damage.base double 0.2 run scoreboard players get @s str

# --- 防御力 (DEF) ---
# DEF - 5
    scoreboard players operation @s temp = @s def
    scoreboard players remove @s temp 5
    # 0以上なら適用、負なら0
        execute if score @s temp matches 0.. store result entity @s attribute.minecraft:armor.base double 1 run scoreboard players get @s temp
        execute if score @s temp matches ..-1 run attribute @s minecraft:armor base set 0

    # --- 移動速度 (AGI) ---
    # (AGI * 2 + 90) / 1000
    # AGI 5 -> 0.1
        scoreboard players operation @s temp = @s agi
        scoreboard players operation @s temp *= #2 temp
        scoreboard players add @s temp 90
        execute store result entity @s attribute.minecraft:movement_speed.base double 0.001 run scoreboard players get @s temp

    # --- 幸運 (LUCK) ---
    # LUCK - 5
        scoreboard players operation @s temp = @s luck
        scoreboard players remove @s temp 5
        execute store result entity @s attribute.minecraft:luck.base double 1 run scoreboard players get @s temp
