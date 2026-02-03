# ステータス適用（プレイヤー用）
# スコアボードの値をMinecraftのAttributeに反映
# @sとして実行される

# --- HP表示 ---
# max_health は常に20（ハート10個）に固定
    attribute @s minecraft:max_health base set 20

# HP割合計算: Heart = (hp/max_hp)*20
    scoreboard players operation @s _ = @s HP
    scoreboard players operation @s _ *= 10000000 _
    scoreboard players operation @s _ /= @s MaxHP
    scoreboard players operation @s _ *= 20 _
    execute if score @s HP matches 1.. if score @s _ matches ..0 run scoreboard players set @s _ 1
    execute store result entity @s Health float 1 run scoreboard players get @s _

# --- 攻撃力適用 ---
# STRによる倍率計算 (atk/update)
    function player:status/atk/update

# --- 防御力適用 ---
# def を装甲値に変換
    scoreboard players operation _ _ = @s DEF
    scoreboard players operation _ _ *= $2 Const
    scoreboard players operation _ _ += $200 Const
    scoreboard players operation @s DmgReceived *= $200 Const
    scoreboard players operation @s DmgReceived /= _ _

# --- 俊敏性適用 ---
# agi を移動速度に変換（AGI 5 = 0.1）
    #scoreboard players operation @s _ = @s AGI
    #scoreboard players operation @s _ *= 2 _
    #scoreboard players add @s _ 90
    #execute store result entity @s attribute.minecraft:movement_speed.base double 0.001 run scoreboard players get @s _

# --- 攻撃速度適用 (SPD) ---
# spd を攻撃速度に変換（デフォルト4.0, SPD 5 = 4.0）
# SPD +1 = +0.1 speed
    #scoreboard players operation @s _ = @s SPD
    #scoreboard players remove @s _ 5
    #execute store result storage rpg:_ spd_bonus double 0.1 run scoreboard players get @s _
    #execute store result entity @s attribute.minecraft:attack_speed.base double 1 run scoreboard players get @s SPD
    # ↑簡単な式にするため、SPD / 5 * 4.0 にする？いや、単純加算がいい。
    # Baseを4.0として、(SPD - 5) * 0.1 を加算したいが、base setしかできないので
    # 4.0 + (SPD - 5) * 0.1
    # = 3.5 + SPD * 0.1
    #scoreboard players operation @s _ = @s SPD
    #scoreboard players add @s _ 35
    #execute store result entity @s attribute.minecraft:attack_speed.base double 0.1 run scoreboard players get @s _

    # --- 幸運適用 (LUCK) ---
    # luck を幸運値に変換（LUCK - 5 = luck）
    # LUCK 5 = 0, LUCK 10 = +5
    #    scoreboard players operation @s _ = @s LUCK
    #    scoreboard players remove @s _ 5
    #    execute store result entity @s attribute.minecraft:luck.base double 1 run scoreboard players get @s _
