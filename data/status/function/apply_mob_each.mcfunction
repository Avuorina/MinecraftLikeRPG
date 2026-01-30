# MOB用ステータス適用（個体処理）
# @s として実行される
# 必要なスコア: max_hp, str, def, agi, luck, _

# --- MaxHP ---
# max_hp スコアをそのままAttributeに適用
# 0以下の場合は適用しない（安全策）
    execute if score @s max_hp matches 1.. store result entity @s Attributes[{Name:"minecraft:max_health"}].Base double 1 run scoreboard players get @s max_hp

# --- 攻撃力 (STR) ---
# STR * 0.2
    execute store result entity @s Attributes[{Name:"minecraft:attack_damage"}].Base double 0.2 run scoreboard players get @s str

# --- 防御力 (DEF) ---
# DEF - 5
    scoreboard players operation @s _ = @s def
    scoreboard players remove @s _ 5
    # 0以上なら適用、負なら0
        execute if score @s _ matches 0.. store result entity @s Attributes[{Name:"minecraft:armor"}].Base double 1 run scoreboard players get @s _
        execute if score @s _ matches ..-1 run attribute @s minecraft:armor base set 0

    # --- 移動速度 (AGI) ---
    # (AGI * 2 + 90) / 1000
    # AGI 5 -> 0.1
        scoreboard players operation @s _ = @s agi
        scoreboard players operation @s _ *= #2 _
        scoreboard players add @s _ 90
        execute store result entity @s Attributes[{Name:"minecraft:movement_speed"}].Base double 0.001 run scoreboard players get @s _

    # --- 幸運 (LUCK) ---
    # LUCK - 5
        scoreboard players operation @s _ = @s luck
        scoreboard players remove @s _ 5
        execute store result entity @s Attributes[{Name:"minecraft:luck"}].Base double 1 run scoreboard players get @s _
