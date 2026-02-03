say apply_mob
# MOB用ステータス適用（個体処理）
# @s として実行される
# 必要なスコア: max_hp, str, def, agi, luck, _

# --- HP ---
# max_hp スコアをそのままAttributeに適用
# 0以下の場合は適用しない（安全策）
    attribute @s max_health base set 512

# --- 攻撃力 (STR) ---
# ATK = STR
#execute store result entity @s attributes[{id:"minecraft:attack_damage"}].base double 1 run scoreboard players get @s STR
    execute store result entity @s attributes[{id:"minecraft:attack_damage"}].base double 1 run scoreboard players get @s STR


# --- 防御力 (DEF) ---
# DEF - 5
#scoreboard players operation @s _ = @s DEF
#scoreboard players remove @s _ 5
# 0以上なら適用、負なら0
#execute if score @s _ matches 0.. store result entity @s attributes[{id:"minecraft:armor"}].base double 1 run scoreboard players get @s _
#execute if score @s _ matches ..-1 run attribute @s minecraft:armor base set 0

# --- 移動速度 (AGI) ---
# AGI / 100
# AGI 23 -> 0.23
    execute store result entity @s attributes[{id:"minecraft:generic.movement_speed"}].base double 0.01 run scoreboard players get @s AGI

# --- 素早さ (AGI) ---
# AGI / 100
# AGI 23 -> 0.23
    execute store result entity @s attributes[{id:"minecraft:generic.movement_speed"}].base double 0.01 run scoreboard players get @s AGI
